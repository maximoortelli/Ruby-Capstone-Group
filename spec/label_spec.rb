require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before(:each) do
    @label = Label.new(
      'title' => 'New',
      'color' => 'green',
      'items' => []
    )

    @item = Item.new(
      'publish_date' => '1967-01-01'
    )
  end

  context 'Testing the Label class' do
    it 'The initialize method should create a item with 4 variables' do
      expect(@label.instance_variables.length).to eq 4
      expect(@label.instance_variables).to eq %i[@id @title @color @items]
    end

    it 'The initialize method should create an instance variable of title' do
      expect(@label.instance_variable_get(:@title)).to eq 'New'
    end

    it 'The initialize method should create an instance variable of color' do
      expect(@label.instance_variable_get(:@color)).to eq 'green'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@label.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@label.instance_variable_get(:@id)).to be_a String
    end
  end

  context '#add_item' do
    it 'The add_item method should add a item to the items array' do
      @label.add_item(@item)
      expect(@label.instance_variable_get(:@items).length).to eq 1
      expect(@label.instance_variable_get(:@items)).to eq [@item]
      expect(@label.instance_variable_get(:@items).first).to be_a Item
      expect(@item.instance_variable_get(:@label)).to be_a Label
      expect(@item.label).to eq(@label)
    end
  end
end
