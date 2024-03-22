# export HF_HOME="$PWD/models"

model=cyberagent/calm2-7b-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-instruct
# model=tokyotech-llm/Swallow-13b-instruct-hf

python -m vllm.entrypoints.openai.api_server \
  --port 4000 \
  --model ${model} \
  --tensor-parallel-size 2 \
  --max-model-len 2048 \
  --gpu-memory-utilization 0.9 \
  --chat-template ./templates/calm2-chat.jinja
  # --chat-template ./templates/elyza-instruct.jinja
  # --chat-template ./templates/swallow-instruct.jinja
