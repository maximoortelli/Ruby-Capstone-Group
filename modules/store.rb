require 'json'
require 'fileutils'

module Store
  def save_books
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/books.json', JSON.dump(@books.map(&:to_json))) unless @books.empty?
  end

  def save_games
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/games.json', JSON.dump(@games.map(&:to_json))) unless @games.empty?
  end

  def save_movies
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/movies.json', JSON.dump(@movies.map(&:to_json))) unless @movies.empty?
  end

  def save_music_albums
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/music_albums.json', JSON.dump(@music_albums.map(&:to_json))) unless @music_albums.empty?
  end

  def save_items
    save_books
    save_games
    save_movies
    save_music_albums
  end

  def save_genres
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/genres.json', JSON.dump(@genres.map(&:to_json))) unless @genres.empty?
  end

  def save_labels
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/labels.json', JSON.dump(@labels.map(&:to_json))) unless @labels.empty?
  end

  def save_authors
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/authors.json', JSON.dump(@authors.map(&:to_json))) unless @authors.empty?
  end

  def save_sources
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/sources.json', JSON.dump(@sources.map(&:to_json))) unless @sources.empty?
  end

  def save_attributes
    save_genres
    save_labels
    save_authors
    save_sources
  end
end
