class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def quiz
    @questions = Question.order('RANDOM()').limit(7).includes(:choices)
  end

  def check
  # params[:answers]は { question_id => choice_id } の形で送られてきます
    correct_count = 0
    params[:answers].each do |question_id, choice_id|
      question = Question.find(question_id)
      correct_choice = question.choices.find_by(correct: true)
      correct_count += 1 if correct_choice.id.to_s == choice_id
    end

    render plain: "正解数は #{correct_count} 問です！"
  end
end
