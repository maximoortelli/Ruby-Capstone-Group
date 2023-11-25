require_relative '../classes/movie'

describe Movie do
  before(:each) do
    @movie = Movie.new(
      'publish_date' => (Date.today - (11 * 365)).strftime
    )

    @movie_silent = Movie.new(
      'publish_date' => (Date.today - (5 * 365)).strftime,
      'silent' => true
    )

    @movie_recent = Movie.new(
      'publish_date' => (Date.today - (5 * 365)).strftime
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a game with 9 variables' do
      expect(@movie.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived @silent]
    end

    it 'The initialize method should create an instance variable of publish_date' do
      expect(@movie.instance_variable_get(:@publish_date)).to eq (Date.today - (11 * 365)).strftime
    end

    it 'The initialize method should create an instance variable of silent' do
      expect(@movie.instance_variable_get(:@silent)).to eq false
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@movie.instance_variable_get(:@id)).to be_a Integer
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years' do
      expect(@movie.can_be_archived?).to eq(true)
    end

    it 'returns false if silent is true' do
      expect(@movie_silent.can_be_archived?).to eq(true)
    end

    it 'returns false if silent is false and published_date less than 10yrs' do
      expect(@movie_recent.can_be_archived?).to eq(false)
    end
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @movie.move_to_archive
      @movie_silent.move_to_archive
      expect(@movie.archived).to eq(true)
      expect(@movie_silent.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @movie_recent.move_to_archive
      expect(@movie_recent.archived).to eq(false)
    end
  end
end
