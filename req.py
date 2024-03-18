import litellm

litellm.set_verbose=True

model="openai/cyberagent/calm2-7b-chat"

response = litellm.completion(
    model=model,
    api_key="EMPTY",
    api_base="http://localhost:4000/v1",
    messages=[
        {"role": "USER", "content": "こんにちは"},
    ],
    temperature=0,
    max_tokens=256
)

print(response)
