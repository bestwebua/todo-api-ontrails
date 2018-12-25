module Docs
  module V1
    module Users
      module Verifications
        extend Dox::DSL::Syntax

        document :api do
          resource 'Index action' do
            endpoint '/users/verification'
            group 'User verification'
          end
        end

        document :index do
          action 'User verification'
        end
      end
    end
  end
end
