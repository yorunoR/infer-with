# model=cyberagent/calm2-7b-chat
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
# model=stabilityai/japanese-stablelm-2-instruct-1_6b
# model=microsoft/Phi-3-mini-128k-instruct
# model=microsoft/Phi-3-mini-4k-instruct
# model=microsoft/Phi-3-small-8k-instruct
# model=microsoft/Phi-3-medium-4k-instruct
# model=aixsatoshi/Honyaku-13b
# model=bullerwins/Codestral-22B-v0.1-hf
# model=elyza/ELYZA-japanese-CodeLlama-7b-instruct
# model=Qwen/Qwen2-0.5B-Instruct
# model=nitky/Oumuamua-7b-instruct-v2
# model=Local-Novel-LLM-project/Ninja-V2-7B
# model=deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct
# model=mistralai/mathstral-7B-v0.1
# model=cyberagent/calm3-22b-chat
# model=Qwen/Qwen2-VL-7B-Instruct
# model=google/paligemma2-10b-ft-docci-448
model=google/gemma-3-12b-it

volume=$PWD/data

echo $model
docker run --runtime nvidia --gpus all \
    -v $volume:/root/.cache/huggingface \
    -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
    -p 4000:8000 \
    --ipc=host \
    vllm/vllm-openai:v0.8.4 \
    --model $model \
    --max-model-len 4096 \
    --tensor-parallel-size 4 \
    --gpu-memory-utilization 0.84 \
    --kv-cache-dtype fp8 \
    --trust-remote-code

  # --chat-template ./templates/calm2-chat.jinja
  # --chat-template ./templates/qwen.jinja
  # --chat-template ./templates/honyaku.jinja
  # --chat-template ./templates/phi-3.jinja
  # --chat-template ./templates/stablelm.jinja
  # --chat-template ./templates/elyza-instruct.jinja
  # --chat-template ./templates/swallow-instruct.jinja
  # --chat-template ./templates/rakuten-chat.jinja
  # --chat-template ./templates/openchat.jinja
  # --chat-template ./templates/phind.jinja
  # --chat-template ./templates/chat-ml.jinja
  # --chat-template ./templates/karakuri.jinja
  # --chat-template ./templates/command-r.jinja
