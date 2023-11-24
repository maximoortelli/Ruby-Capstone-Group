require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new(
      'publish_date' => (Date.today - (11 * 365)).strftime,
      'publisher' => 'Bloomsbury Publishing',
      'cover_state' => ''
    )
    @book_recent = Book.new(
      'publish_date' => (Date.today - (5 * 365)).strftime,
      'publisher' => 'Bloomsbury Publishing',
      'cover_state' => 'bad'
    )

    @book_good = Book.new(
      'publish_date' => (Date.today - (5 * 365)).strftime,
      'publisher' => 'Bloomsbury Publishing',
      'cover_state' => 'good'
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a item with 9 variables' do
      expect(@book.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived
                                                @publisher @cover_state]
    end

    it 'The initialize method should create an instance variable of publish_date' do
      expect(@book.instance_variable_get(:@publish_date)).to eq (Date.today - (11 * 365)).strftime
    end

    it 'The initialize method should create an instance variable of archived' do
      expect(@book.instance_variable_get(:@archived)).to eq false
    end

    it 'The initialize method should create an instance variable of Publisher' do
      expect(@book.instance_variable_get(:@publisher)).to eq 'Bloomsbury Publishing'
    end

    it 'The initialize method should create an instance variable of cover_state' do
      expect(@book_recent.instance_variable_get(:@cover_state)).to eq 'bad'
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@book.instance_variable_get(:@id)).to be_a String
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years' do
      expect(@book.can_be_archived?).to eq(true)
    end

    it 'returns false if cover_state is bad' do
      expect(@book_recent.can_be_archived?).to eq(true)
    end

    it 'returns false if cover_state is not bad and published_date less than 10yrs' do
      expect(@book_good.can_be_archived?).to eq(false)
    end
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @book.move_to_archive
      @book_recent.move_to_archive
      expect(@book.archived).to eq(true)
      expect(@book_recent.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @book_good.move_to_archive
      expect(@book_good.archived).to eq(false)
    end
  end
end
