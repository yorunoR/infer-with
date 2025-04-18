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
# model=ibm-granite/granite-8b-code-instruct
# model=DataPilot/ArrowPro-7B-KUJIRA
# model=stabilityai/japanese-stablelm-2-instruct-1_6b
# model=microsoft/Phi-3-mini-128k-instruct
# model=microsoft/Phi-3-mini-4k-instruct
# model=microsoft/Phi-3-small-8k-instruct
# model=microsoft/Phi-3-medium-4k-instruct
# model=DataPilot/ArrowPro-7B-RobinHood
# model=nitky/Oumuamua-7b-instruct
# model=nitky/Oumuamua-7b-instruct-v2
# model=aixsatoshi/Honyaku-13b
# model=bullerwins/Codestral-22B-v0.1-hf
# model=elyza/ELYZA-japanese-CodeLlama-7b-instruct
# model=Qwen/Qwen2-0.5B-Instruct
# model=Qwen/Qwen2-7B-Instruct
# model=shisa-ai/shisa-v1-llama3-8b
# model=Local-Novel-LLM-project/Ninja-V2-7B
# model=deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct
# model=elyza/Llama-3-ELYZA-JP-8B
# model=google/gemma-2-9b-it
# model=google/gemma-2-27b-it
# model=UCLA-AGI/Gemma-2-9B-It-SPPO-Iter3
# model=cyberagent/calm3-22b-chat
# model=internlm/internlm2_5-7b-chat
# model=HODACHI/EZO-Humanities-9B-gemma-2-it
# model=mistralai/mathstral-7B-v0.1
# model=mistralai/Mistral-7B-Instruct-v0.3
# model=mistralai/Mistral-Nemo-Instruct-2407
# model=DataPilot/Llama3.1-ArrowSE-v0.4
# model=aixsatoshi/Meta-Llama-3.1-8B-Instruct-plus-Swallow
# model=Qwen/Qwen2-VL-7B-Instruct
# model=google/paligemma2-10b-ft-docci-448
# model=google/gemma-3-12b-it
# model=Qwen/Qwen2.5-VL-32B-Instruct
# model=Qwen/Qwen2.5-14B-Instruct
model=Qwen/Qwen2.5-VL-7B-Instruct

huggingface-cli download --resume-download $model


# dataset=elyza/ELYZA-tasks-100
# dataset=nvidia/OpenMathInstruct-1
# dataset=gorilla-llm/Berkeley-Function-Calling-Leaderboard
# dataset=lightblue/tengu_bench
# dataset=yuzuai/rakuda-questions
# dataset=bigcode/bigcodebench
# dataset=livebench/instruction_following
# dataset=livebench/reasoning
# dataset=livebench/math
# dataset=livebench/coding
# dataset=livebench/language
# dataset=livebench/data_analysis

# huggingface-cli download --resume-download --repo-type dataset $dataset
