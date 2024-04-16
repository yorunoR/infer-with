export HF_HOME="$PWD/data"

model=cyberagent/calm2-7b-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-instruct
# model=tokyotech-llm/Swallow-13b-instruct-hf
# model=Rakuten/RakutenAI-7B-chat
# model=openchat/openchat_3.5
# model=berkeley-nest/Starling-LM-7B-alpha
# model="./data/hub/RakutenAI-7B-chat_merged"
# model=lightblue/qarasu-14B-chat-plus-unleashed
# model="./data/hub/karakuri-lm-70b-chat-v0.1-GPTQ"
# model="CohereForAI/c4ai-command-r-v01"
# model="CohereForAI/c4ai-command-r-plus"
# model="NTQAI/chatntq-ja-7b-v1.0"
# model="TFMC/Japanese-Starling-ChatV-7B"
# model="Nexusflow/Starling-LM-7B-beta"
# model=karakuri-ai/karakuri-lm-70b-chat-v0.1

python -m vllm.entrypoints.openai.api_server \
  --port 4000 \
  --model ${model} \
  --tensor-parallel-size 2 \
  --max-model-len 2048 \
  --gpu-memory-utilization 0.9 \
  --trust-remote-code \
  --chat-template ./templates/calm2-chat.jinja
  # --chat-template ./templates/elyza-instruct.jinja
  # --chat-template ./templates/swallow-instruct.jinja
  # --chat-template ./templates/rakuten-chat.jinja
  # --chat-template ./templates/openchat.jinja
  # --chat-template ./templates/phind.jinja
  # --chat-template ./templates/chat-ml.jinja
  # --chat-template ./templates/karakuri.jinja
  # --chat-template ./templates/command-r.jinja
