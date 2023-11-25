require 'json'
require 'fileutils'

module Load
  def load_books
    return unless File.exist?('data/books.json')

    JSON.parse(File.read('data/books.json')).map do |book|
      book_obj = JSON.parse(book, create_additions: true)
      @items << book_obj
      @books << book_obj
    end
  end

  def load_games
    return unless File.exist?('data/games.json')

    JSON.parse(File.read('data/games.json')).map do |game|
      game_obj = JSON.parse(game, create_additions: true)
      @items << game_obj
      @games << game_obj
    end
  end

  def load_movies
    return unless File.exist?('data/movies.json')

    JSON.parse(File.read('data/movies.json')).map do |movie|
      movie_obj = JSON.parse(movie, create_additions: true)
      @items << movie_obj
      @movies << movie_obj
    end
  end

  def load_music_albums
    return unless File.exist?('data/music_albums.json')

    JSON.parse(File.read('data/music_albums.json')).map do |music_album|
      music_album_obj = JSON.parse(music_album, create_additions: true)
      @items << music_album_obj
      @music_albums << music_album_obj
    end
  end

  def load_items
    load_books
    load_games
    load_movies
    load_music_albums
  end

  def load_genres
    return unless File.exist?('data/genres.json')

    # Convert @items to a Hash for faster lookup
    items_hash = {}
    @items.each { |item| items_hash[item.id] = item }

    JSON.parse(File.read('data/genres.json')).each do |genre_json|
      genre_obj = JSON.parse(genre_json)
      genre = Genre.new('name' => genre_obj['name'])

      genre_obj['items'].each do |id|
        item = items_hash[id]
        genre.add_item(item) unless item.nil?
      end

      @genres << genre
    end
  end

  def load_labels
    return unless File.exist?('data/labels.json')

    # Convert @items to a Hash for faster lookup
    items_hash = {}
    @items.each { |item| items_hash[item.id] = item }

    JSON.parse(File.read('data/labels.json')).each do |label_json|
      label_obj = JSON.parse(label_json)
      label = Label.new('title' => label_obj['title'], 'color' => label_obj['color'])

      label_obj['items'].each do |id|
        item = items_hash[id]
        label.add_item(item) unless item.nil?
      end

      @labels << label
    end
  end

  def load_authors
    return unless File.exist?('data/authors.json')

    # Convert @items to a Hash for faster lookup
    items_hash = {}
    @items.each { |item| items_hash[item.id] = item }

    JSON.parse(File.read('data/authors.json')).each do |author_json|
      author_obj = JSON.parse(author_json)
      author = Author.new('first_name' => author_obj['first_name'], 'last_name' => author_obj['last_name'])

      author_obj['items'].each do |id|
        item = items_hash[id]
        author.add_item(item) unless item.nil?
      end

      @authors << author
    end
  end

  def load_sources
    return unless File.exist?('data/sources.json')

    # Convert @items to a Hash for faster lookup
    items_hash = {}
    @items.each { |item| items_hash[item.id] = item }

    JSON.parse(File.read('data/sources.json')).each do |source_json|
      source_obj = JSON.parse(source_json)
      source = Source.new('name' => source_obj['name'])

      source_obj['items'].each do |id|
        item = items_hash[id]
        source.add_item(item) unless item.nil?
      end

      @sources << source
    end
  end

  def load_attributes
    load_genres
    load_labels
    load_authors
    load_sources
  end
end
