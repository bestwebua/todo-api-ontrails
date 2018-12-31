module V1::Lib::Step::Auth
  class CheckUserVerification
    extend Uber::Callable

    def self.call(ctx, **)
      ctx[:model].verified?
    end
  end
end
