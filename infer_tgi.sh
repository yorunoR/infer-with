model=cyberagent/calm2-7b-chat
# model=Rakuten/RakutenAI-7B-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-instruct
# model=tokyotech-llm/Swallow-13b-instruct-hf
# model=teknium/OpenHermes-2.5-Mistral-7B
# model=elyza/ELYZA-japanese-Llama-2-13b-fast-instruct
# model=Phind/Phind-CodeLlama-34B-v2
# model=/data/Mistral-7B-v0.1-AWQ
# model=/data/Phind-CodeLlama-34B-v2-GPTQ
# model=/data/train_2024-04-06-19-25-28
# model=lightblue/qarasu-14B-chat-plus-unleashed
# model=/data/karakuri-lm-70b-chat-v0.1-GPTQ
# model=CohereForAI/c4ai-command-r-v01
# model=CohereForAI/c4ai-command-r-plus
# model=karakuri-ai/karakuri-lm-70b-chat-v0.1
# model=TFMC/Japanese-Starling-ChatV-7B
# model=Sdff-Ltba/LightChatAssistant-2x7B
# model=NTQAI/chatntq-ja-7b-v1.0
# model=/data/1.0-chatvector
# model=/data/shepherd-0.8-codevector
# model=ibm-granite/granite-8b-code-instruct
# model=DataPilot/ArrowPro-7B-KUJIRA
# model=Local-Novel-LLM-project/Vecteus-v1
# model=microsoft/Phi-3-mini-128k-instruct
# model=microsoft/Phi-3-small-8k-instruct
# model=microsoft/Phi-3-medium-4k-instruct
# model=stabilityai/japanese-stablelm-2-instruct-1_6b
# model=DataPilot/ArrowPro-7B-RobinHood
# model=nitky/Oumuamua-7b-instruct
# model=nitky/Oumuamua-7b-instruct-v2
# model=Qwen/Qwen2-7B-Instruct
# model=shisa-ai/shisa-v1-llama3-8b
# model=deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct
# model=elyza/Llama-3-ELYZA-JP-8B
# model=google/gemma-2-9b-it
# model=google/gemma-2-27b-it

volume=$PWD/data/hub

echo $model
docker run --gpus all --shm-size 1g \
  -e HUGGING_FACE_HUB_TOKEN=$HF_TOKEN \
  -v $volume:/data -p 4000:80 ghcr.io/huggingface/text-generation-inference:2.1 \
  --model-id $model \
  --max-batch-prefill-tokens 4096 \
  --num-shard 2 \
  --cuda-memory-fraction 0.98 \
  --trust-remote-code
  # --quantize eetq \
  # --quantize bitsandbytes-fp4
  # --quantize gptq
  # swallow & rakuten --max-input-length 600 \
  # swallow & rakuten --max-total-tokens 2400 \
