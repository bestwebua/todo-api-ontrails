require 'rails_helper'

describe V1::Users::EraseNotVerificatedUsersWorker, type: :worker do
  before do
    allow(V1::Users::UsersToDeleteQuery).to receive(:call).and_return(User.where(verified: false))
    create_list :user, 3
  end

  it 'calls V1::Users::UsersToDeleteQuery' do
    expect(V1::Users::UsersToDeleteQuery).to receive(:call)
    subject.perform
  end

  it 'deletes not verificated users' do
    expect { subject.perform }.to change(User, :count).from(3).to(0)
  end
end
