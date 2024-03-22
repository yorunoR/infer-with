# infer-with-vllm
vllm を使って ローカル LLM を実行します

## 環境設定
GPU 等の環境は事前に設定済みであるとします

```
git clone https://github.com/yorunoR/infer-by-vllm
cd infer-by-vllm
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## 実行方法
```
./infer.sh
```
※実行前に GPU の数や VRAM 量にあわせ、`infer.sh` 内のパラメータを設定し直して下さい

localhost:4000 で起動するので、curl 等でアクセスしてください
```
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

```

litellm を使ったアクセス
```
python litellm_req.py
```

## モデル変更について
デフォルトで `cyberagent/calm2-7b-chat` に設定されています  
`infer.sh`、`litellm_req.py` を編集してモデルを切り替えて下さい
