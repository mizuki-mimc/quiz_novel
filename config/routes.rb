Rails.application.routes.draw do
  root 'questions#home'                      # トップページにスタートボタン
  post '/start', to: 'questions#start'       # クイズ開始処理

  get '/questions/:number', to: 'questions#show', as: 'question' # 各クイズ画面
  post '/questions/answer', to: 'questions#answer'               # 回答処理
  get '/questions/result', to: 'questions#result', as: 'questions_result' # 総評画面
end
