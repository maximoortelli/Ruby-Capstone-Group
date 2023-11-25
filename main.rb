require './app'
require './menu'

class Main
  ACTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_movies,
    4 => :list_games,
    5 => :list_genres,
    6 => :list_labels,
    7 => :list_authors,
    8 => :list_sources,
    9 => :create_book,
    10 => :create_music_album,
    11 => :create_movie,
    12 => :create_game
  }.freeze
  def start
    app = App.new
    app.load_items
    app.load_attributes
    option = nil

    while option != 13
      Menu.display
      option = user_input
      handle_option(app, option) if option && option != 13
    end

    app.save_items
    app.save_attributes
    puts "\nThanks for using the Catelog App!"
  end

  def user_input
    gets.chomp.to_i
  end

  def handle_option(app, option)
    method = ACTIONS[option]
    return unless app.respond_to?(method)

    app.public_send(method)
  end
end

Main.new.start
