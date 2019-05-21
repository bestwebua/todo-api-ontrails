module V1::Lib::Step::Error
  class InitializeCustomErrors
    extend Uber::Callable

    def self.call(ctx, **)
      ctx[:errors] ||= {}
    end
  end
end
