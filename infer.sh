# export HF_DATASETS_CACHE="/path/to/another/directory"

# model=gorilla-llm/gorilla-openfunctions-v2
# model=mistralai/Mistral-7B-Instruct-v0.2
model=cyberagent/calm2-7b-chat

python -m vllm.entrypoints.openai.api_server \
  --port 4000 \
  --model ${model} \
  --tensor-parallel-size 2 \
  --max-model-len 2048 \
  --gpu-memory-utilization 0.5 \
  --chat-template ./template.jinja
