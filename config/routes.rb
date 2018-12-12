Rails.application.routes.draw do
  scope :api, module: :v1, constraints: Api::VersionService.new(:v1, true) do
    namespace :users do
      resource :registration, only: :create
    end
    # post '/sign_in', to: 'authentication#create'
    # get '/sign_out', to: 'authentication#destroy'
  end
end
