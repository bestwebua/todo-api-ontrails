module V1::Users::Representer
  class Create < JSONAPI::Serializable::Resource
    type 'users'
    attributes :email
  end
end
