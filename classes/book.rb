require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :cover_state, :publisher
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @publisher = params['publisher']
    @cover_state = params['cover_state']
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    json_obj = {
      'json_class' => self.class.name,
      'id' => @id,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
    json_obj.to_json
  end

  def self.json_create(object)
    new(
      'id' => object['id'],
      'publisher' => object['publisher'],
      'cover_state' => object['cover_state'],
      'publish_date' => object['publish_date'],
      'archived' => object['archived']
    )
  end
end
