require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @on_spotify = params['on_spotify'] || false
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_args)
    json_obj = {
      'json_class' => self.class.name,
      'id' => @id,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
    json_obj.to_json
  end

  def self.json_create(object)
    new({
          'id' => object['id'],
          'on_spotify' => object['on_spotify'],
          'publish_date' => object['publish_date'],
          'archived' => object['archived']
        })
  end
end
