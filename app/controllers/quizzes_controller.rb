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

    # 選択した答えを取得
    selected_answer = params[:answer].to_i

    # 今の問題のIDを取得
    quiz = Quiz.find(quiz_ids[current_index])

    # 答えの正誤をチェックしたり、スコアをセッションに保存したりも可能
    # ここではシンプルに次の問題へ進む処理だけ書く

    # current_index を次へ
    session[:current_index] += 1

    # 次の問題があれば問題ページへ、なければ結果ページへリダイレクト
    if session[:current_index] >= quiz_ids.length
      redirect_to quiz_results_path
    else
      redirect_to quiz_question_path
    end
  end

  def next_question
    session[:current_index] += 1
    redirect_to quiz_question_path
  end

  def results
  # 仮のビュー表示
  end
end
