Rails.application.routes.draw do
  post 'signup', controller: :signup, action: :create
end
