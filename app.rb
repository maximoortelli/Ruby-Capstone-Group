require_relative 'modules/store'
require_relative 'modules/load'
require_relative 'modules/create_item'

class App
  include CreateItem
  include Store
  include Load

  attr_accessor :items, :genres, :labels, :authors, :sources

  def initialize
    @items = []
    @books = []
    @games = []
    @music_albums = []
    @movies = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end
  # end

  def list_books
    if @books.empty?
      puts "\nNo books found."
      return
    end
    puts "\n=== List of All Books ==="
    @books.each_with_index do |book, index|
      puts "\n#{index + 1}) #{book.publish_date} - #{book.publisher} - #{book.cover_state}"
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts "\nNo music albums found."
      return
    end
    puts "\n=== List of All Music Album ==="
    @music_albums.each_with_index do |music_album, index|
      puts "\n#{index + 1}) #{music_album.publish_date} - #{music_album.on_spotify}"
    end
  end

  def list_movies
    if @movies.empty?
      puts "\nNo movies found."
      return
    end
    puts "\n=== List of All Movies ==="
    @movies.each_with_index do |movie, index|
      puts "\n#{index + 1}) #{movie.publish_date} - #{movie.silent}"
    end
  end

  def list_games
    if @games.empty?
      puts "\nNo games found."
      return
    end
    puts "\n=== List of All Games ==="
    @games.each_with_index do |game, index|
      puts "\n#{index + 1}) #{game.publish_date} - #{game.multiplayer}"
    end
  end

  def list_genres
    if @genres.empty?
      puts "\nNo genres found."
      return
    end
    puts "\n=== List of All Genres ==="
    @genres.each_with_index do |genre, index|
      puts "\n#{index + 1}) - #{genre.name}"
    end
  end

  def list_labels
    if @labels.empty?
      puts "\nNo labels found."
      return
    end
    puts "\n=== List of All Label ==="
    @labels.each_with_index do |label, index|
      puts "\n#{index + 1}) #{label.title} - #{label.color}"
    end
  end

  def list_authors
    if @authors.empty?
      puts "\nNo authors found."
      return
    end
    puts "\n=== List of All Authors ==="
    @authors.each_with_index do |author, index|
      puts "\n#{index + 1}) #{author.first_name} - #{author.last_name}"
    end
  end

  def list_sources
    if @sources.empty?
      puts "\nNo sources found."
      return
    end
    puts "\n=== List of All Sources ==="
    @sources.each_with_index do |source, index|
      puts "\n#{index + 1}) #{source.name}"
    end
  end
end
