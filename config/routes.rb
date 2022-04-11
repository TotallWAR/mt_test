Rails.application.routes.draw do
  root "checkout#index"
  get '/checkout/summary', to: 'checkout#summary'

  get "/items/:id", to: "item#show"
end
