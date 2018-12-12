module V1::Users::Registrations::Representer
  class Create < JSONAPI::Serializable::Resource
    type 'user'
    attributes :email
  end
end
