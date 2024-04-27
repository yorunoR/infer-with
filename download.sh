export HF_HOME="$PWD/data"
export HF_HUB_ENABLE_HF_TRANSFER=1

# model=cyberagent/calm2-7b-chat
# model=Rakuten/RakutenAI-7B-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-fast-instruct
# model=umiyuki/Japanese-Chat-Umievo-itr001-7b
# model=Sdff-Ltba/LightChatAssistant-2x7B

huggingface-cli download --resume-download $model
