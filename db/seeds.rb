puts "== Seed start =="

Question.delete_all
Choice.delete_all

questions_data = [
  {
    content: "問題1の内容です",
    choices: [
      { content: "選択肢1-1", correct: false },
      { content: "選択肢1-2", correct: true },
      { content: "選択肢1-3", correct: false },
      { content: "選択肢1-4", correct: false }
    ]
  },
  {
    content: "問題2の内容です",
    choices: [
      { content: "選択肢2-1", correct: false },
      { content: "選択肢2-2", correct: false },
      { content: "選択肢2-3", correct: true },
      { content: "選択肢2-4", correct: false }
    ]
  },
  {
    content: "問題30の内容です",
    choices: [
      { content: "選択肢2-1", correct: false },
      { content: "選択肢2-2", correct: false },
      { content: "選択肢2-3", correct: true },
      { content: "選択肢2-4", correct: false }
    ]
  }
]

questions_data.each do |q_data|
  question = Question.create!(content: q_data[:content])
  q_data[:choices].each do |choice_data|
    question.choices.create!(content: choice_data[:content], correct: choice_data[:correct])
  end
end

puts "Created #{Question.count} questions."
puts "== Seed end =="
