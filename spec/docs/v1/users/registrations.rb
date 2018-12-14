module Docs
  module V1
    module Users
      module Registrations
        extend Dox::DSL::Syntax

        document :api do
          resource 'Create action' do
            endpoint '/users/registration'
            group 'User registration'
          end
        end

        document :create do
          action 'Sign Up'
        end
      end
    end
  end
end
