require 'securerandom'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(params = {})
    @id = params['id'] || SecureRandom.uuid
    @name = params['name']
    @items = params['items'] || []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'id' => @id,
      'name' => @name,
      'items' => @items.map(&:id)
    }.to_json
  end
end