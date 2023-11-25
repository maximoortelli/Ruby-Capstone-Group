class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(params = {})
    @id = params['id'] || Random.rand(1..1_000_000)
    @first_name = params['first_name']
    @last_name = params['last_name']
    @items = params['items'] || []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items.map(&:id)
    }.to_json
  end
end
