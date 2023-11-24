require_relative '../classes/music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new(
      'publish_date' => (Date.today - (11 * 365)).strftime,
      'on_spotify' => true
    )

    @music_album_recent = MusicAlbum.new(
      'publish_date' => (Date.today - (5 * 365)).strftime
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a game with 8 variables' do
      expect(@music_album.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived
                                                       @on_spotify]
    end

    it 'The initialize method should create an instance variable of publish_date' do
      expect(@music_album.instance_variable_get(:@publish_date)).to eq (Date.today - (11 * 365)).strftime
    end

    it 'The initialize method should create an instance variable of on_spotify' do
      expect(@music_album.instance_variable_get(:@on_spotify)).to eq true
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@music_album.instance_variable_get(:@id)).to be_a String
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years and on_spotify is true' do
      expect(@music_album.can_be_archived?).to eq(true)
    end

    it 'returns false if on_spotify is false' do
      expect(@music_album_recent.can_be_archived?).to eq(false)
    end
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @music_album.move_to_archive
      expect(@music_album.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @music_album_recent.move_to_archive
      expect(@music_album_recent.archived).to eq(false)
    end
  end
end
