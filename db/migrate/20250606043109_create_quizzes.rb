class CreateQuizzes < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.integer :answer

      t.timestamps
    end
  end
end
