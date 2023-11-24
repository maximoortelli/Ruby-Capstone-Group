require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name, items = [])
    @first_name = first_name
    @last_name = last_name
    @items = items
    @id = generate_id
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  private

  def generate_id
    SecureRandom.uuid
  end
end
