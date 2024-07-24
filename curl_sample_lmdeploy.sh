curl http://localhost:4000/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "/root/.cache/huggingface/hub/models--Qwen--Qwen2-7B-Instruct/snapshots/41c66b0be1c3081f13defc6bdf946c2ef240d6a6",
        "messages": [
          {
            "role": "user",
            "content": "こんにちは"
          }
        ]
    }'
