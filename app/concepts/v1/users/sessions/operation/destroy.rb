module V1::Users::Sessions::Operation
  class Destroy < Trailblazer::Operation
    step V1::Lib::Step::Error::InitializeCustomErrors
    step V1::Lib::Step::Session::Destroy
  end
end
