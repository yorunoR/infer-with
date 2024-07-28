model=cyberagent/calm2-7b-chat
# model=Qwen/Qwen2-7B-Instruct
# model=Rakuten/RakutenAI-7B-chat
# model=cyberagent/calm3-22b-chat

volume=$PWD/data

echo $model
docker run -it \
   --network=host \
   --group-add=video \
   --ipc=host \
   --cap-add=SYS_PTRACE \
   --security-opt seccomp=unconfined \
   --device /dev/kfd \
   --device /dev/dri \
   -v $volume:/root/.cache/huggingface \
   -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
   vllm-rocm \
   vllm serve $model \
   --max-model-len 4096 \
   --tensor-parallel-size 1 \
   --gpu-memory-utilization 0.88 \
   --kv-cache-dtype fp8 \
   --port 4000 \
   --trust-remote-code
