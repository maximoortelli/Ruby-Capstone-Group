require_relative '../classes/source'
require_relative '../classes/item'

describe Source do
  before(:each) do
    @source = Source.new(
      'name' => 'New York Times',
      'items' => []
    )

    @item = Item.new(
      'publish_date' => '1967-01-01'
    )
  end

  context 'Testing the Source class' do
    it 'The initialize method should create a item with 3 variables' do
      expect(@source.instance_variables.length).to eq 3
      expect(@source.instance_variables).to eq %i[@id @name @items]
    end

    it 'The initialize method should create an instance variable of name' do
      expect(@source.instance_variable_get(:@name)).to eq 'New York Times'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@source.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@source.instance_variable_get(:@id)).to be_a String
    end
  end

  context '#add_item' do
    it 'The add_item method should add a item to the items array' do
      @source.add_item(@item)
      expect(@source.instance_variable_get(:@items).length).to eq 1
      expect(@source.instance_variable_get(:@items)).to eq [@item]
      expect(@source.instance_variable_get(:@items).first).to be_a Item
      expect(@item.instance_variable_get(:@source)).to be_a Source
      expect(@item.source).to eq(@source)
    end
  end
end
