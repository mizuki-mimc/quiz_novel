class QuizzesController < ApplicationController
  def start
    # スタートページのアクション
  end

  def begin_quiz
    # 30問からランダムに5問選ぶ
    session[:quiz_ids] = Quiz.pluck(:id).sample(5)
    session[:current_index] = 0
    redirect_to quiz_question_path
  end

  def question
    quiz_ids = session[:quiz_ids]
    current_index = session[:current_index]

  # 終わった場合は結果ページに飛ばす
    if current_index >= quiz_ids.length
      redirect_to quiz_results_path and return
    end

    @quiz = Quiz.find(quiz_ids[current_index])
  end

  def explanation
    quiz_ids = session[:quiz_ids]
    current_index = session[:current_index]

    @quiz = Quiz.find(quiz_ids[current_index])
    @selected_answer = params[:answer].to_i

    # 次に進むボタン押したら current_index += 1 して次の問題へ
  end

  def answer
    quiz_ids = session[:quiz_ids]
    current_index = session[:current_index]

  # パラメータ取得
    selected_answer = params[:answer].to_i

  # 不正な回答チェック（セーフガード）
    if selected_answer < 1 || selected_answer > 4
      flash[:alert] = "回答を選択してください。"
      redirect_to quiz_question_path and return
    end

    @quiz = Quiz.find(quiz_ids[current_index])
    @selected_answer = selected_answer

    render :explanation
  end

  def next_question
    session[:current_index] += 1
    redirect_to quiz_question_path
  end

  def results
    quiz_ids = session[:quiz_ids]
    total_questions = quiz_ids.length

  # 正解数のカウントをSessionに入れてた場合
  # 例えば answerアクションで session[:correct_count] += 1 してた場合はこれが使える
    correct_count = session[:correct_count] || 0

    @score = correct_count * 100 / total_questions  # 例：100点満点に換算
  end
end
