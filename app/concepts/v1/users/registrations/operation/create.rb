module V1::Users::Registrations::Operation
  class Create < Trailblazer::Operation
    step V1::Lib::Step::Error::InitializeCustomErrors
    step Model(User, :new)
    step Contract::Build(constant: V1::Users::Registrations::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step V1::Lib::Step::Mailers::Users::CreateConfirmation
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = { class: { User: V1::Users::Registrations::Representer::Create } }
    end
  end
end
