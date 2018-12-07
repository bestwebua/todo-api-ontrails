module Users::Operation
  class Create < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Users::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = { class: { User: Users::Representer::Create } }
    end
  end
end
