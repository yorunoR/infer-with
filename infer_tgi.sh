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

volume=$PWD/data/hub

echo $model
docker run --gpus all --shm-size 1g \
  -v $volume:/data -p 4000:80 ghcr.io/huggingface/text-generation-inference:2.0 \
  --model-id $model \
  --num-shard 2 \
  --cuda-memory-fraction 1.0 \
  --max-batch-prefill-tokens 2048 \
  --max-input-tokens=2048 \
  # --quantize eetq
  # --quantize bitsandbytes-fp4
  # --quantize gptq
  # swallow & rakuten --max-input-length 600 \
  # swallow & rakuten --max-total-tokens 2400 \
