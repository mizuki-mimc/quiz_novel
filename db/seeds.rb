# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Quiz.create(question: "ある朝、グレーゴル・ザムザがなにか気がかりな夢から目をさますと、自分が寝床の中で一匹の巨大な虫に変っているのを発見した。", choice1: "壁", choice2: "変身", choice3: "人間に向いてない", choice4: "夢十夜", answer: 2)
Quiz.create(question: "きょう、ママンが死んだ。もしかすると、昨日かも知れないが、私にはわからない。", choice1: "ノルウェイの森", choice2: "火垂るの墓", choice3: "異邦人", choice4: "君の膵臓をたべたい", answer: 3)
Quiz.create(question: "国境の長いトンネルを抜けると雪国であった。夜の底が白くなった。信号所に汽車が止まった。", choice1: "雪渡り", choice2: "銀河鉄道の夜", choice3: "雪国", choice4: "蜜柑", answer: 3)
Quiz.create(question: "「春がニ階から落ちてきた。」", choice1: "重力ピエロ", choice2: "ノルウェイの森", choice3: "眠れる美女", choice4: "朝の散歩", answer: 1)
Quiz.create(question: "えたいの知れない不吉な塊が私の心を始終圧おさえつけていた。", choice1: "嘔吐", choice2: "海辺のカフカ", choice3: "羅生門", choice4: "檸檬", answer: 4)
Quiz.create(question: "そして私は質屋へ行こうと思い立ちました。", choice1: "質屋の女房", choice2: "蔵の中", choice3: "罪と罰", choice4: "走れメロス", answer: 2)
Quiz.create(question: "七月はじめ、めっぽう暑いさかりのある日暮れどき、ひとりの青年が、S横町にまた借りしている狭くるしい小部屋からおもてに出て、のろくさと、どこかためらいがちに、K橋のほうへ歩きだした。", choice1: "羅生門", choice2: "グレート・ギャツビー", choice3: "罪と罰", choice4: "檸檬", answer: 3)
Quiz.create(question: "幸福な家庭はすべて似よったものであるが、不幸な家庭はみなそれぞれに不幸である。", choice1: "アンナ・カレーニナ", choice2: "自負と偏見", choice3: "人間失格", choice4: "ペスト", answer: 1)
Quiz.create(question: "「トム！」答えなし。「トム！」答えなし。", choice1: "トムは真夜中の庭で", choice2: "トム・ソーヤーの冒険", choice3: "赤毛のアン", choice4: "白鯨", answer: 2)
