Rails.application.routes.draw do
  get '/', to: redirect('api/documentation/v1')

  scope :api do
    get '/documentation/:version', to: 'documentation#show'
  end

  scope :api, module: :v1, constraints: Api::VersionService.new(:v1, true) do
    namespace :users do
      resource :registration, only: :create
    end
  end
end
