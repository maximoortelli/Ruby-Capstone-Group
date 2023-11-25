require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/source'
require_relative '../classes/item'

module ItemAttributes
  ITEM_TYPES = { 1 => 'Book', 2 => 'Game', 3 => 'Music Album', 4 => 'Movie' }.freeze
  GENRE_NAME_PROMPT = 'Enter the genre name: '.freeze
  AUTHOR_FIRST_NAME_PROMPT = 'Enter the author first name: '.freeze
  AUTHOR_LAST_NAME_PROMPT = 'Enter the author last name: '.freeze
  LABEL_TITLE_PROMPT = 'Enter the label title: '.freeze
  LABEL_COLOR_PROMPT = 'Enter the label color: '.freeze
  SOURCE_NAME_PROMPT = 'Enter the source name: '.freeze

  def create_genre(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s genre? [Y/N]: "
    genre_answer = gets.chomp.downcase
    return unless genre_answer == 'y'

    print GENRE_NAME_PROMPT
    name = gets.chomp
    Genre.new('name' => name)
  end

  def create_author(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s author? [Y/N]: "
    author_answer = gets.chomp.downcase
    return unless author_answer == 'y'

    print AUTHOR_FIRST_NAME_PROMPT
    first_name = gets.chomp
    print AUTHOR_LAST_NAME_PROMPT
    last_name = gets.chomp
    Author.new(
      'first_name' => first_name,
      'last_name' => last_name
    )
  end

  def create_label(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s label? [Y/N]: "
    label_answer = gets.chomp.downcase
    return unless label_answer == 'y'

    print LABEL_TITLE_PROMPT
    title = gets.chomp
    print LABEL_COLOR_PROMPT
    color = gets.chomp
    Label.new(
      'title' => title,
      'color' => color
    )
  end

  def create_source(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s source? [Y/N]: "
    source_answer = gets.chomp.downcase
    return unless source_answer == 'y'

    print SOURCE_NAME_PROMPT
    name = gets.chomp
    Source.new('name' => name)
  end
end
