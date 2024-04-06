import litellm

litellm.set_verbose=True

model = "openai/cyberagent/calm2-7b-chat"
# model = "openai/Rakuten/RakutenAI-7B-chat"
# model = "openai/elyza/ELYZA-japanese-Llama-2-13b-instruct"
# model = "openai/tokyotech-llm/Swallow-13b-instruct-hf"
# model = "openai/teknium/OpenHermes-2.5-Mistral-7B"
# model = "openai/./data/hub/RakutenAI-7B-chat_merged"
# model = "openai/elyza/ELYZA-japanese-Llama-2-13b-fast-instruct"

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


response = litellm.completion(
    model=model,
    api_key="EMPTY",
    api_base="http://localhost:4000/v1",
    messages=[
        # {"role": "system", "content": system},
        {"role": "user", "content": content},
    ],
    max_tokens=1800,
    temperature=0.1,
    frequency_penalty=0,
    presence_penalty=-1, # tgi
    # presence_penalty=-0.9, # swallow & rakuten
    # presence_penalty=1,
    top_p=0.99,
)

print(response)
