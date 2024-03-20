# export HF_DATASETS_CACHE="/path/to/another/directory"

# model=gorilla-llm/gorilla-openfunctions-v2
# model=mistralai/Mistral-7B-Instruct-v0.2
# model=cyberagent/calm2-7b-chat
model=elyza/ELYZA-japanese-Llama-2-13b-instruct

python -m vllm.entrypoints.openai.api_server \
  --port 4000 \
  --model ${model} \
  --tensor-parallel-size 2 \
  --max-model-len 2048 \
  --gpu-memory-utilization 0.9 \
  --chat-template ./elyza-instruct.jinja

#   --chat-template ./template.jinja
