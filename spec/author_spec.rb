require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before(:each) do
    @author = Author.new(
      'first_name' => 'Rowling',
      'last_name' => 'J. K.',
      'items' => []
    )

    @item = Item.new(
      'publish_date' => '1967-01-01'
    )
  end

  context 'Testing the Author class' do
    it 'The initialize method should create a item with 4 variables' do
      expect(@author.instance_variables.length).to eq 4
      expect(@author.instance_variables).to eq %i[@id @first_name @last_name @items]
    end

    it 'The initialize method should create an instance variable of first_name' do
      expect(@author.instance_variable_get(:@first_name)).to eq 'Rowling'
    end

    it 'The initialize method should create an instance variable of last_name' do
      expect(@author.instance_variable_get(:@last_name)).to eq 'J. K.'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@author.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@author.instance_variable_get(:@id)).to be_a String
    end
  end

  context '#add_item' do
    it 'The add_item method should add a item to the items array' do
      @author.add_item(@item)
      expect(@author.instance_variable_get(:@items).length).to eq 1
      expect(@author.instance_variable_get(:@items)).to eq [@item]
      expect(@author.instance_variable_get(:@items).first).to be_a Item
      expect(@item.instance_variable_get(:@author)).to be_a Author
      expect(@item.author).to eq(@author)
    end
  end
end
