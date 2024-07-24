model=Qwen/Qwen2-7B-Instruct
# model=google/gemma-2-9b-it

volume=$PWD/data

echo $model
docker run --runtime nvidia --gpus all \
    -v $volume:/root/.cache/huggingface \
    -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
    -p 4000:23333 \
    --ipc=host \
    openmmlab/lmdeploy:latest \
    lmdeploy serve api_server --tp 4 $model
