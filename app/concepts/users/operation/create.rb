module Users::Operation
  class Create < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Users::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
