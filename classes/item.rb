require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(params = {})
    @id = params[:id] || SecureRandom.uuid
    @genre = params[:genre] || nil
    @author = params[:author] || nil
    @source = params[:source] || nil
    @label = params[:label] || nil
    @publish_date = params[:publish_date]
    @archived = params[:archived] || false
  end

  def can_be_archived?
    publish_date = Date.parse(@publish_date)
    return false unless publish_date < (Date.today - (10 * 365))

    true
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
