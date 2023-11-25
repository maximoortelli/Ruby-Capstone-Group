require_relative '../classes/game'

describe Game do
  before(:each) do
    @game = Game.new(
      'publish_date' => (Date.today - (11 * 365)).strftime,
      'last_played_at' => (Date.today - (3 * 365)).strftime
    )

    @game_played_recent = Game.new(
      'publish_date' => (Date.today - (5 * 365)).strftime,
      'last_played_at' => (Date.today - (3 * 365)).strftime
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a game with 9 variables' do
      expect(@game.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived @multiplayer
                                                @last_played_at]
    end

    it 'The initialize method should create an instance variable of publish_date' do
      expect(@game.instance_variable_get(:@publish_date)).to eq (Date.today - (11 * 365)).strftime
    end

    it 'The initialize method should create an instance variable of multiplayer' do
      expect(@game.instance_variable_get(:@multiplayer)).to eq false
    end

    it 'The initialize method should create an instance variable of last_played_at' do
      expect(@game.instance_variable_get(:@last_played_at)).to eq (Date.today - (3 * 365)).strftime
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@game.instance_variable_get(:@id)).to be_a Integer
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years and last_played older than 2' do
      expect(@game.can_be_archived?).to eq(true)
    end

    it 'returns false if published_date is less than 10 years  or last_played older than 2' do
      expect(@game_played_recent.can_be_archived?).to eq(false)
    end
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @game.move_to_archive
      expect(@game.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @game_played_recent.move_to_archive
      expect(@game_played_recent.archived).to eq(false)
    end
  end
end
