shared_context 'Authenticated User' do
  let(:current_user) { create(:user) }

  before do
    request.headers.merge! current_user.create_new_auth_token
  end
end
