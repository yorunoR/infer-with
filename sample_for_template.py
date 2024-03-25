import os

from transformers import AutoTokenizer

os.environ['HF_HOME'] = os.path.join(os.path.dirname(__file__), 'data')
dir = os.path.join(os.path.dirname(__file__), 'data')

print(dir)
print('============================')
model="cyberagent/calm2-7b-chat"
tokenizer = AutoTokenizer.from_pretrained(model)

t="""{% for message in messages %}{% if message['role'] == 'assistant' %}{{'ASSISTANT: ' + message['content']}}
{% else %}{{'USER: ' + message['content']}}
{% endif %}{% endfor %}ASSISTANT:"""

tokenizer.chat_template = t
tokenizer.save_pretrained(f"./outputs/{model}")

print('============================')
model="elyza/ELYZA-japanese-Llama-2-13b-instruct"
tokenizer = AutoTokenizer.from_pretrained(model)

t="""<s>[INST] <<SYS>>{% for message in messages %}{% if message['role'] == 'system' %}
{{message['content']}}
{% endif %}{% endfor %}<</SYS>>
{{''}}
{% for message in messages %}{% if message['role'] == 'user' %}{{message['content'] + ' [/INST] '}}{% elif message['role'] == 'assistant' %}{{message['content']}} </s><s>{{'[INST] '}}{% endif %}{% endfor %}"""

tokenizer.chat_template = t
tokenizer.save_pretrained(f"./outputs/{model}")

print('============================')
model="tokyotech-llm/Swallow-13b-instruct-hf"
tokenizer = AutoTokenizer.from_pretrained(model)

t="""以下に、あるタスクを説明する指示があり、それに付随する入力が更なる文脈を提供しています。リクエストを適切に完了するための回答を記述してください。
{% for message in messages %}
{% if message['role'] == 'system' %}{{'### 指示:'}}
{{message['content']}}
{% elif message['role'] == 'user' %}{{'### 入力:'}}
{{message['content']}}
{% elif message['role'] == 'assistant' %}{{'### 応答:'}}
{{message['content']}}
{% endif %}{% endfor %}
### 応答:"""

tokenizer.chat_template = t
tokenizer.save_pretrained(f"./outputs/{model}")
