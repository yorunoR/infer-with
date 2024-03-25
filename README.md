# infer-with
vllm や tgi を使って ローカル LLM を実行します

## 環境設定
GPU 等の環境は事前に設定済みであるとします  
tgi の起動には docker を使用しているので、 NVIDIA Container Toolkit をインストールしておいてください

```
git clone https://github.com/yorunoR/infer-with
cd infer-with
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## vllm 実行方法
```
./vllm_infer.sh
```
※実行前に GPU の数や VRAM 量にあわせ、`vllm_infer.sh` 内のパラメータを設定し直して下さい

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

## tgi 実行方法
```
./tgi_infer.sh
```
※実行前に GPU の数や VRAM 量にあわせ、`tgi_infer.sh` 内のパラメータを設定し直して下さい

モデル内の `tokenizer_config.json` ファイルの `chat_template` の項目をチャット形式から平文に変換するテンプレートとして利用するので、未設定であれば設定してください
```
{
  ....,
  "chat_template": "jinjaによるテンプレート",
  ....,
}
```

localhost:4000 で起動するので、curl 等でアクセスしてください

## litellm を使ったアクセス
```
python litellm_req.py
```

## モデル変更について
デフォルトで `cyberagent/calm2-7b-chat` に設定されています  
`vllm_infer.sh`、`tgi_infer.sh`、`litellm_req.py` を編集してモデルを切り替えて下さい

## jinja のプレビュー用
http://jinja.quantprogramming.com/
```
messages: [
  {"role": "system", "content": "system-message"},
  {"role": "user", "content": "user-message-1"},
  {"role": "assistant", "content": "ai-message"},
  {"role": "user", "content": "user-message-2"},
]
```
