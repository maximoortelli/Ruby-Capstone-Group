class Menu
  def self.display
    puts "\nWelcome to Media Library Home Page!"
    puts 'Please enter a number: '
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres (e.g \'Comedy\', \'Thriller\')'
    puts '6 - List all labels (e.g. \'Gift\', \'New\')'
    puts '7 - List all authors (e.g. \'Stephen King\')'
    puts '8 - List all sources (e.g. \'From a friend\')'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  def self.invalid_option
    puts 'Invalid option. Please try again.'
  end
end
