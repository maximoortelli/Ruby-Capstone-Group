require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @multiplayer = params['multiplayer'] || false
    @last_played_at = params['last_played_at']
  end

  def can_be_archived?
    super && Date.parse(@last_played_at) < (Date.today - (2 * 365))
  end

  def to_json(*_args)
    json_obj = {
      'json_class' => self.class.name,
      'id' => @id,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
    json_obj.to_json
  end

  def self.json_create(object)
    new(
      'id' => object['id'],
      'multiplayer' => object['multiplayer'],
      'last_played_at' => object['last_played_at'],
      'publish_date' => object['publish_date'],
      'archived' => object['archived']
    )
  end
end
