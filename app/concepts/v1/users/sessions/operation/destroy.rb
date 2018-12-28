module V1::Users::Sessions::Operation
  class Destroy < Trailblazer::Operation
    step V1::Lib::Step::Auth::AuthorizeUser
  end
end
