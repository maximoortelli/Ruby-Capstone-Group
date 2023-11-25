require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  before(:each) do
    @genre = Genre.new(
      'name' => 'Action',
      'items' => []
    )

    @item = Item.new(
      'publish_date' => '1967-01-01'
    )
  end

  context 'Testing the Genre class' do
    it 'The initialize method should create a item with 3 variables' do
      expect(@genre.instance_variables.length).to eq 3
      expect(@genre.instance_variables).to eq %i[@id @name @items]
    end

    it 'The initialize method should create an instance variable of name' do
      expect(@genre.instance_variable_get(:@name)).to eq 'Action'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@genre.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@genre.instance_variable_get(:@id)).to be_a Integer
    end
  end

  context '#add_item' do
    it 'The add_item method should add a item to the items array' do
      @genre.add_item(@item)
      expect(@genre.instance_variable_get(:@items).length).to eq 1
      expect(@genre.instance_variable_get(:@items)).to eq [@item]
      expect(@genre.instance_variable_get(:@items).first).to be_a Item
      expect(@item.instance_variable_get(:@genre)).to be_a Genre
      expect(@item.genre).to eq(@genre)
    end
  end
end
