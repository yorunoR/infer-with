import litellm
import time

# litellm.set_verbose=True

model = "openai/cyberagent/calm2-7b-chat"
# model = "openai/Rakuten/RakutenAI-7B-chat"
# model = "openai/elyza/ELYZA-japanese-Llama-2-13b-instruct"
# model = "openai/tokyotech-llm/Swallow-13b-instruct-hf"
# model = "openai/teknium/OpenHermes-2.5-Mistral-7B"
# model = "openai/./data/hub/RakutenAI-7B-chat_merged"
# model = "openai/elyza/ELYZA-japanese-Llama-2-13b-fast-instruct"
# model = "openai/./data/hub/Phind-CodeLlama-34B-v2-GPTQ"
# model = "openai/./data/hub/train_2024-04-06-19-25-28"
# model = "openai/lightblue/qarasu-14B-chat-plus-unleashed"
# model = "openai/./data/hub/karakuri-lm-70b-chat-v0.1-GPTQ"
# model = "openai/NTQAI/chatntq-ja-7b-v1.0"
# model = "openai/TFMC/Japanese-Starling-ChatV-7B"
# model = "openai/Nexusflow/Starling-LM-7B-beta"
# model = "openai/Phind/Phind-CodeLlama-34B-v2"
# model = "openai/CohereForAI/c4ai-command-r-v01"
# model = "openai/karakuri-ai/karakuri-lm-70b-chat-v0.1"
# model = "openai/umiyuki/Japanese-Chat-Umievo-itr001-7b"
# model = "openai/DataPilot/ArrowPro-7B-KUJIRA"
# model = "openai/stabilityai/japanese-stablelm-2-instruct-1_6b"
# model = "openai/microsoft/Phi-3-medium-4k-instruct"
# model = "openai/aixsatoshi/Honyaku-13b"
# model = "openai/bullerwins/Codestral-22B-v0.1-hf"
# model = "openai/elyza/ELYZA-japanese-CodeLlama-7b-instruct"

# system = "あなたは誠実で優秀な日本人のアシスタントです。"
# content = "こんにちは"
# content = "富士山とは"
# content = "仕事の熱意を取り戻すためのアイデアを5つ挙げてください。"
# content = "論理的な書き方で議論を評価するための5つの主要な原則を説明してください。"
# content = "医者になったつもりで、さまざまな病気や症状に対する革新的な治療法を考えてください。伝統的な薬、薬草、自然療法などを処方することが含まれます。また、提案する際には、患者の年齢、ライフスタイル、医療履歴を考慮する必要があります。では、激しい腹痛の症状診断から始めてみてください。"
content = "以下の一文で始まるミステリー短編小説を作成してください：「ある晴れた日、公園の桜の木の下で、一冊の古い日記が見つかった。」"
# content = "次の三つの最新のスマートフォン、iPhone、Samsung Galaxy、Google Pixelに対する、さまざまな情報源からの顧客レビューを分析し、各電話について1から10のスケールで全体的な評価を提供してください。以下の複雑で矛盾したレビューを考慮に入れてください： - TechRadarによる最新のiPhoneのレビュー：新しいiPhoneは、スマートフォンのパフォーマンスとカメラの品質に新たな基準を設ける、驚くべき技術の勝利です。しかし、デザインの微増と高価格は、以前のiPhoneの「すげー」ファクターを欠いています。それでも、そのパワーと性能は無比です。 - CNETによる最新のSamsung Galaxyのレビュー：Samsung Galaxyの携帯電話には、素晴らしいスクリーン、高速なパフォーマンス、堅実なバッテリー寿命、そして印象的なカメラオプションなど、たくさんのハイポイントがあります。しかしながら、Bixbyはまだ物足りなく、AR絵文字は平坦で、全体的なデザインはそれほど変わっていません。新しいGalaxyは全体的に素晴らしい電話ですが、いくつかの小さな弱点が真の偉大さを達成するのを妨げています。 - The Vergeによる最新のGoogle Pixelのレビュー：GoogleのPixelは、最新の仕様、革新的なAIパワードソフトウェア、そして素晴らしいカメラをスリークなデザインに詰め込んでいます。しかし、バッテリー寿命が物足りない、拡張可能なストレージがない、そして高価格を考慮すると、パフォーマンスが時々つまづくことがあります。シームレスなソフトウェア、エリートの写真撮影、そしてGoogleのAIアシスタンスが最も重要なら、Pixelが好きになるでしょう。しかし、全体的な体験は競合他社ほどまんべんなくはありません。 それぞれのスマートフォンの全体的な評価を10点満点で1つのJSONオブジェクトで返してください、小数点第一位まで。"
# content = "江戸時代の侍を主人公とする短編小説の登場人物を鮮やかに描写してください。主人公の侍の性格、外見、特技、生き様を具体的に述べてください。"
# content = "公の場で話すのが苦手な友人を、地元の「ことばの会」でボランティアとして参加するよう説得するメールを書いてください。親しみやすい日本語で、友情と共感を表現してください。"
# content = "ある朝目覚めて、突然自分が忍者になってしまったという設定の短編小説の序章を書いてください。"
# content = "東京湾に架かるレインボーブリッジの工事が行われたとき、どのような留意点が重要だったか述べてください。"
# content = "追加のデータ構造を使わずに、二つの配列の共通要素を見つけるプログラムを実装してください。"
# content = "f(x) = 4x^3 - 9x - 14 + 3 が与えられたとき、f(0.1)の値を求めてください。"
# content = "満月から次の満月まで ２９．５３日かかるものとします。ある【うるう年】の ９月３０日が満月であるとき、次の満月を１回目として、１００回目の満月となるのは何年後の何月何日ですか。ただし、【うるう年】は４年に１度、必ずあるものとします。"

# content = """In an era marked by rapid globalization, the intricate interplay between international law, economic policies, and political dynamics has become increasingly complex.
# Legal frameworks, once confined within national borders, now stretch across continents, necessitating a nuanced understanding of transnational legislation and treaties.
# As multinational corporations navigate the labyrinthine maze of global markets, economic theories that underpin currency fluctuations, trade imbalances, and fiscal policies are more pertinent than ever.
# Central to these economic considerations is the concept of market equilibrium, a delicate balance affected by myriad factors including consumer behavior, governmental regulations, and global crises.
# Politically, the landscape is equally labyrinthine. Ideological shifts and the resurgence of nationalism have reshaped diplomatic relations, with international agreements and alliances being tested under the strain of geopolitical tensions.
# The role of supranational entities like the United Nations and the European Union in mediating these conflicts is of paramount importance, as is the need for diplomatic finesse in an increasingly multipolar world.
# Furthermore, the intersection of politics and economics is evident in the debate over economic sanctions and their efficacy in swaying political decisions.
# In this context, understanding the subtleties of rhetoric used in political discourse, and how it interweaves with legal jargon and economic terminology, is crucial.
# For instance, the rhetoric surrounding fiscal austerity measures often intertwines with legal discourse on budgetary legislation and economic debates on inflation control.
# Similarly, discussions on constitutional amendments are frequently laden with political undertones, reflecting broader societal issues and ideological divides.
# This convergence of legal, economic, and political vernacular presents a unique challenge for machine translation systems, demanding not only linguistic accuracy but also a deep comprehension of the nuanced interplay of these disciplines."""

# question = "1辺が10単位、高さが5単位の三角形の面積を求めなさい。"
# name="calculate_triangle_area"
# description="三角形の底辺と高さから、その面積を計算します。"
# question = "ジョギングが好きな人の性格を3つ挙げなさい。"
# name="get_personality_traits"
# description="趣味や活動に基づいて、人々の共通の性格を取得します。"
# question = "ゲーム『ゼルダの伝説 ブレス オブ ザ ワイルド』に登場する武器「ガーディアンソードプラス」の攻撃力は？"
# name = "get_game_item_stats"
# description = "特定のビデオゲームの特定のアイテムの統計情報を取得します。"
# content = f"""「{question}」という指示に対して、{name}という関数を使います。
# {name}は、{description}
# {name}の返り値を予測しなさい。返り値は[[と]]で囲ってください。
# 回答は、以下の形式でしてください。
# 説明:（説明）
# 返り値: [[返り値]]"""

# content = """あなたは、タスクを実行するために関数を呼び出すAIアシスタントです。
#
# 関数を呼び出すことで、タスクやユーザーからの問い合わせをサポートすることができます。関数を呼び出すには、1つの関数を呼び出すJSONオブジェクト、または複数の関数を呼び出すJSONオブジェクトのリストで応答します：
#
# "function"：このフィールドには、呼び出したい関数の名前を記述する。
# "arguments"：このフィールドに関数の引数を記述する。
#
# 応答が終了したら、各関数の呼び出し結果が表示されます。
#
# ---
# ## 関数
# 以下は、システムとのやりとりに使用できる関数のリストです。各関数には固有のパラメータと要件があります。各関数の指示に注意深く従うようにしてください。
# 実行したいタスクに応じて、適切な関数を選択してください。JSON形式で関数コールを提供してください。
#
# ### Function \'latest_exchange_rate\'
# 指定した2つの通貨の最新の為替レートを取得します。
# #### Parameters
# amount (float) 変換する金額。省略した場合は、1単位の通貨の交換レートを使用します。
# source_currency (string) 変換元の通貨。
# target_currency (string) 換算する通貨。
#
# ---
#
#
# 英ポンドから日本円への最新の為替レートを教えてください。"""

start = time.perf_counter() #計測開始

response = litellm.completion(
    model=model,
    api_key="EMPTY",
    api_base="http://localhost:4000/v1",
    messages=[
        # {"role": "system", "content": system},
        {"role": "user", "content": content},
    ],
    max_tokens=1800,
    temperature=0.01,
    frequency_penalty=0,
    presence_penalty=-1, # tgi
    # presence_penalty=-0.9, # swallow & rakuten
    # presence_penalty=0, # vllm
    # presence_penalty=1,
    top_p=0.99,
    stop=['<end_of_turn>'],
    stream=True
)

for part in response:
    print(part.choices[0].delta.content or "", end='')

end = time.perf_counter() #計測終了
print("\n{:.2f}".format(end-start))

# print(response)
