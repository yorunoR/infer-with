# model=mistralai/Mistral-7B-Instruct-v0.2
# model=tokyotech-llm/Swallow-13b-hf
# model=elyza/ELYZA-japanese-Llama-2-13b-fast
# model=cyberagent/calm2-7b
model=cyberagent/calm2-7b-chat

curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "cyberagent/calm2-7b-chat",
        "messages": [
          {
            "role": "USER",
            "content": "こんにちは"
          }
        ],
        "max_tokens": 256,
        "temperature": 0
    }'
