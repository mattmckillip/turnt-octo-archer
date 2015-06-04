require 'turnt/octo/archer/github'


RSpec.describe Github do
  before :each do
    @github = Github.new('http://github.cerner.com/api/v3/repos/', 'OpsInfra', 'ops_spork')
  end

  describe '.id' do
    it 'returns id' do
      expect(@github.id).to eq 9524
    end
  end

  describe '.name' do
    it 'returns name' do
      expect(@github.name).to eq 'ops_spork'
    end
  end

  describe '.owner' do
    it 'returns owner' do
      expect(@github.owner).to eq 'OpsInfra'
    end
  end

  describe '.private?' do
    it 'returns private?' do
      expect(@github.private?).to eq false
    end
  end

  describe '.url' do
    it 'returns url' do
      expect(@github.url).to eq 'http://github.cerner.com/api/v3/repos/OpsInfra/ops_spork'
    end
  end

  describe '.created_at' do
    it 'returns date created_at' do
      expect(@github.created_at).to eq '2013-10-22T16:09:27Z'
    end
  end

  describe '.issues?' do
    it 'returns issues' do
      expect(@github.issues?).to eq true
    end
  end

  describe '.default_branch' do
    it 'returns default_branch' do
      expect(@github.default_branch).to eq 'master'
    end
  end

  describe '.subscribers' do
    it 'returns subscribers' do
      expect(@github.subscribers).to eq 19
    end
  end

  describe '.yearly_commits' do
    it 'returns number of commits this year' do
      expect(@github.yearly_commits).to be > 50
    end
  end

  describe '.commits_per_day_of_week' do
    it 'returns number of commits for a given day of the week' do
      expect(@github.commits_per_day_of_week(4)).to be > 5
    end
  end

  describe '.commits_per_hour_of_day' do
    it 'returns number of commits for a certain hour in a day' do
      expect(@github.commits_per_hour_of_day(12)).to be > 5
    end
  end

  describe '.number_of_branches' do
    it 'returns number of branches for the repo' do
      expect(@github.number_of_branches).to eq 7
    end
  end


  describe '.latest_committer' do
    it 'returns name of latestcommitter ' do
      expect(@github.latest_committer).to eq 'David Crowder'
    end
  end

  describe '.commits_past_weeks' do
    it 'returns muber of commits_past_weeks ' do
      expect(@github.commits_past_weeks(5)).to eq 3
    end
  end

  describe '.current_issues' do
    it 'returns information about the of current issues ' do
      expect(@github.current_issues[0]['user']).to eq 'ab8971'
    end
  end

  describe '.commits_per_author' do
    it 'returns number of commits for authors ' do
      expect(@github.commits_per_author['David Crowder']).to be > 1
    end
  end

  describe '.languages' do
    it 'returns number lines per language ' do
      expect(@github.languages['Ruby']).to eq 75_750
    end
  end
end