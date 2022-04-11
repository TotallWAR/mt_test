Rails.application.routes.draw do
  root "checkout#index"
  get '/checkout/summary', to: 'checkout#summary'
end
