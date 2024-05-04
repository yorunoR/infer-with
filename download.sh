export HF_HOME="$PWD/data"
export HF_HUB_ENABLE_HF_TRANSFER=1

# model=cyberagent/calm2-7b-chat
# model=Rakuten/RakutenAI-7B-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-fast-instruct
# model=umiyuki/Japanese-Chat-Umievo-itr001-7b
# model=Sdff-Ltba/LightChatAssistant-2x7B
# model=Local-Novel-LLM-project/Ninja-v1
# model=Local-Novel-LLM-project/Vecteus-v1
# model=TFMC/Japanese-Starling-ChatV-7B
# model=Local-Novel-LLM-project/Assistance
# model=nvidia/OpenMath-Mistral-7B-v0.1-hf
# model=peiyi9979/math-shepherd-mistral-7b-prm
# model=prometheus-eval/prometheus-7b-v2.0

huggingface-cli download --resume-download $model
