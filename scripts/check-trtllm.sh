
#!/usr/bin/env bash
set +e

echo "=== Local TensorRT-LLM ==="
if python3 -c "import tensorrt_llm; print('Version:', tensorrt_llm.__version__)" 2>/dev/null; then
    echo "Local installation: FOUND"
else
    echo "Local installation: NOT FOUND"
fi

echo
echo "=== Docker TensorRT-LLM ==="
if docker image inspect \
  nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc24 \
  >/dev/null 2>&1; then
    echo "Docker image: FOUND"
    docker run --rm \
      nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc24 \
      python3 -c \
      "import tensorrt_llm; print('Version:', tensorrt_llm.__version__)"
else
    echo "Docker image: NOT FOUND"
    echo "Pull with:"
    echo "docker pull nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc24"
fi
