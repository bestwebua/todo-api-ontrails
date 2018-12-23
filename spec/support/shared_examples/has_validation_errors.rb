RSpec.shared_examples 'has validation errors' do
  it 'has validation errors' do
    match_validation_errors(result, errors)
  end
end
