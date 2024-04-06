from peft import PeftModel
from transformers import AutoModelForCausalLM, AutoTokenizer


base_model_path="Rakuten/RakutenAI-7B-chat"
base_model = AutoModelForCausalLM.from_pretrained(base_model_path)
tokenizer = AutoTokenizer.from_pretrained(base_model_path)

peft_path = "./data/hub/train_2024-04-06-19-25-28/"
peft_model = PeftModel.from_pretrained(base_model, peft_path)

merged_model = peft_model.merge_and_unload()

output_dir = "./data/hub/RakutenAI-7B-chat_merged"
merged_model.save_pretrained(output_dir)
tokenizer.save_pretrained(output_dir)
