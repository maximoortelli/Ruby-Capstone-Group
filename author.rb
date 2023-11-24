require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(params = {})
    @id = params['id'] || SecureRandom.uuid
    @first_name = params['first_name']
    @last_name = params['last_name']
    @items = params['items'] || []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
