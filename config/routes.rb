Rails.application.routes.draw do

  # クイズ画面とチェック用ルート
  get "questions/quiz"
  get "questions/index"
  post "questions/check", to: "questions#check"

  # ヘルスチェック（そのままでOK）
  get "up" => "rails/health#show", as: :rails_health_check

  # ルート定義（トップページにするコントローラ）
  root "questions#quiz"
end
