class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:start] 

  def home
    render template: 'questions/home'
  end

  def start
    question_ids = Question.order("RANDOM()").limit(7).pluck(:id)
    session[:question_ids] = question_ids
    session[:answers] = {}
    redirect_to question_path(1)
  end

  def show
    question_ids = session[:question_ids]
    return redirect_to root_path unless question_ids

    number = params[:number].to_i
    return redirect_to questions_result_path if number > question_ids.length

    @current_number = number
    @question = Question.find(question_ids[number - 1])
  end

  def answer
    session[:answers] ||= {}
    session[:answers][params[:question_id]] = params[:choice_id].to_i

    next_number = params[:current_number].to_i + 1
    redirect_to next_number > 7 ? questions_result_path : question_path(next_number)
  end

  def result
    question_ids = session[:question_ids]
    answers = session[:answers]
    @results = []
    @correct_count = 0

    question_ids.each do |qid|
      question = Question.find(qid)
      selected_choice = question.choices.find_by(id: answers[qid.to_s] || answers[qid])
      correct_choice = question.choices.find_by(correct: true)
      is_correct = selected_choice&.correct

      @correct_count += 1 if is_correct

      @results << {
        question: question,
        selected_choice: selected_choice,
        correct_choice: correct_choice,
        correct: is_correct
      }
    end
  end
end
