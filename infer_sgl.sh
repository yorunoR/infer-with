# model=Qwen/Qwen2-7B-Instruct
# model=google/gemma-2-9b-it
model=google/gemma-2-27b-it
# model=cyberagent/calm3-22b-chat

volume=$PWD/data

echo $model
docker run --gpus all \
    -v $volume:/root/.cache/huggingface \
    -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
    -p 4000:4000 \
    --ipc=host \
    lmsysorg/sglang:latest \
    python3 -m sglang.launch_server \
    --model-path $model \
    --host 0.0.0.0 \
    --port 4000 \
    --disable-cuda-graph \
    --tp 4 --enable-p2p-check --mem-fraction-static 0.84 \
    --quantization fp8
