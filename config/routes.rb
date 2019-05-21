require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get '/', to: redirect('api/documentation/v1')

  scope :api do
    get '/documentation/:version', to: 'documentation#show'
  end

  scope :api, module: :v1, constraints: Api::VersionService.new(:v1, true) do
    namespace :users do
      resource :registration, only: :create
      resource :verification, only: :show
      resource :session, only: %i[create destroy]
    end
  end
end
