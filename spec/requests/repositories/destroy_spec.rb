describe '/repositories', type: :request do

  let(:current_user) { create(:user, :admin) }

  before { sign_in current_user }

  it 'archives a repository on destroy' do
    repository = create(:repository)

    expect { delete "/repositories/#{repository.id}" }.to change { repository.reload.archived? }
      .from(false)
      .to(true)
  end

end
