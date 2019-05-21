module V1::Users::Sessions::Representer
  class Create < JSONAPI::Serializable::Resource
    type 'user'
    attributes :email
  end
end
