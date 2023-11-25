require_relative 'item_attributes'
require_relative 'update_item'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/music_album'
require_relative '../classes/movie'

module CreateItem
  include ItemAttributes
  include UpdateItem
  PUBLISHER_PROMPT = "Enter the Publisher's name: ".freeze
  COVER_STATE_PROMPT = 'Enter the Cover State [1: New, 2: Good and 3: Bad]: '.freeze
  PUBLISH_DATE_PROMPT = 'Enter the Publish Date [YYYY-MM-DD]: '.freeze
  MULTIPLAYER_PROMPT = 'is it a multiplayer? [Y/N]: '.freeze
  LAST_PLAYED_PROMPT = 'Enter the last played date [YYYY-MM-DD]: '.freeze
  SPOTIFY_PROMPT = 'Is it on Spotify? [Y/N]: '.freeze
  SILENT_PROMPT = 'Is it a silent movie? [Y/N]: '.freeze

  def create_book
    print PUBLISHER_PROMPT
    publisher = gets.chomp
    print COVER_STATE_PROMPT
    cover_state = select_cover_state
    print PUBLISH_DATE_PROMPT
    publish_date = gets.chomp
    book = Book.new(
      'publisher' => publisher,
      'cover_state' => cover_state,
      'publish_date' => publish_date
    )

    genre = create_genre(1)
    author = create_author(1)
    label = create_label(1)
    source = create_source(1)
    update_item(book, genre, author, label, source)
    @books << book
    puts "\nBook added successfully!"
  end

  def create_game
    print MULTIPLAYER_PROMPT
    multiplayer = gets.chomp.downcase == 'y'
    print LAST_PLAYED_PROMPT
    last_played_at = gets.chomp
    print PUBLISH_DATE_PROMPT
    publish_date = gets.chomp
    game = Game.new(
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at,
      'publish_date' => publish_date
    )

    genre = create_genre(2)
    author = create_author(2)
    label = create_label(2)
    source = create_source(2)
    update_item(game, genre, author, label, source)
    @games << game
    puts "\nGame added successfully!"
  end

  def create_music_album
    print SPOTIFY_PROMPT
    on_spotify = gets.chomp.downcase == 'y'
    print PUBLISH_DATE_PROMPT
    publish_date = gets.chomp
    music_album = MusicAlbum.new(
      'on_spotify' => on_spotify,
      'publish_date' => publish_date
    )

    genre = create_genre(3)
    author = create_author(3)
    label = create_label(3)
    source = create_source(3)
    update_item(music_album, genre, author, label, source)
    @music_albums << music_album
    puts "\nMusic Album added successfully!"
  end

  def create_movie
    print PUBLISH_DATE_PROMPT
    publish_date = gets.chomp
    print SILENT_PROMPT
    silent = gets.chomp.downcase == 'y'
    movie = Movie.new(
      'publish_date' => publish_date,
      'silent' => silent
    )
    genre = create_genre(3)
    author = create_author(3)
    label = create_label(3)
    source = create_source(3)
    update_item(movie, genre, author, label, source)
    @movies << movie
    puts "\nMovie Album added successfully!"
  end

  def select_cover_state
    cover_state = gets.chomp.to_i
    case cover_state
    when 1
      'new'
    when 2
      'good'
    when 3
      'bad'
    end
  end
end
