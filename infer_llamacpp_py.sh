# model=LightChatAssistant-2x7B_q8.gguf
# model=karakuri-lm-70b-chat-v0.1-q4_K_M.gguf
# model=ELYZA-japanese-Llama-2-7b-instruct-q4_K_M.gguf
# model=RakutenAI-7B-instruct-q4_K_M.gguf
model=RakutenAI-7B-q8_0.gguf

python -m llama_cpp.server \
       --model ./gguf/${model} \
       --chat_format intel \
       --n_gpu_layers -1 \
       --host 0.0.0.0 \
       --port 4000

# chat_format list
# https://github.com/abetlen/llama-cpp-python/blob/main/llama_cpp/llama_chat_format.py
# @register_chat_format("llama-2")
# @register_chat_format("llama-3")
# @register_chat_format("alpaca")
# @register_chat_format("qwen")
# @register_chat_format("vicuna")
# @register_chat_format("oasst_llama")
# @register_chat_format("baichuan-2")
# @register_chat_format("baichuan")
# @register_chat_format("openbuddy")
# @register_chat_format("redpajama-incite")
# @register_chat_format("snoozy")
# @register_chat_format("phind")
# @register_chat_format("intel")
# @register_chat_format("open-orca")
# @register_chat_format("mistrallite")
# @register_chat_format("zephyr")
# @register_chat_format("pygmalion")
# @register_chat_format("chatml")
# @register_chat_format("mistral-instruct")
# @register_chat_format("chatglm3")
# @register_chat_format("openchat")
# @register_chat_format("saiga")
# @register_chat_format("gemma")
