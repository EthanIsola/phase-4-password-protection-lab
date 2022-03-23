Rails.application.routes.draw do
  post "/signup", to: "user#create"
  get "/me", to: "user#show"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
end
