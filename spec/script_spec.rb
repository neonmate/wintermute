describe 'script' do

  before do
    create(:user, nickname: 'neonmate')
  end

  it 'runs seed_awesome_rails.rb without errors' do
    expect { load('script/seed_awesome_rails.rb') }.to change(Repository, :count).from(0).to(92)
  end

  it 'runs seed_awesome_nodejs_projects.rb without errors' do
    expect { load('script/seed_awesome_nodejs_projects.rb') }.to change(Repository, :count).from(0).to(36)
  end

  it 'runs seed_awesome_opensource_apps.rb without errors' do
    expect { load('script/seed_awesome_opensource_apps.rb') }.to change(Repository, :count).from(0).to(141)
  end

end
