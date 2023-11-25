require_relative 'item'

class Movie < Item
  attr_accessor :silent
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @silent = params['silent'] || false
  end

  def can_be_archived?
    super || @silent
  end

  def to_json(*_args)
    json_obj = {
      'json_class' => self.class.name,
      'id' => @id,
      'silent' => @silent,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
    json_obj.to_json
  end

  def self.json_create(object)
    new(
      'id' => object['id'],
      'silent' => object['silent'],
      'publish_date' => object['publish_date'],
      'archived' => object['archived']
    )
  end
end
