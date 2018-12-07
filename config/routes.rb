Rails.application.routes.draw do
  scope :api do
    scope :auth do
      post '/', to: 'users#create'
      post '/remove_me', to: 'users#destroy'

      # post '/sign_in', to: 'authentication#create'
      # get '/sign_out', to: 'authentication#destroy'
    end
  end
end
