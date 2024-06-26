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
# model=Local-Novel-LLM-project/Ninja-v1
# model=Local-Novel-LLM-project/Vecteus-v1
# model=Local-Novel-LLM-project/Assistance

volume=$PWD/data/hub

echo $model
docker run --device /dev/kfd --device /dev/dri --shm-size 1g \
  -v $volume:/data -p 4000:80 ghcr.io/huggingface/text-generation-inference:1.4-rocm \
  --model-id $model \
  --max-batch-prefill-tokens 2048 \
  --max-input-length 600 \
  --max-total-tokens 2400 \
  # --max-input-tokens=2048 \
  # --num-shard 2 \
  # --cuda-memory-fraction 1.0 \
  # --quantize eetq
  # --quantize bitsandbytes-fp4
  # --quantize gptq
  # swallow & rakuten & ninja --max-input-length 600 \
  # swallow & rakuten & ninja --max-total-tokens 2400 \
