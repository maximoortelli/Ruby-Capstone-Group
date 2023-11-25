module UpdateItem
  def update_item(*args)
    item = args.find { |arg| arg.is_a?(Item) }
    args.each { |arg| process_arg(arg, item) }
  end

  def process_arg(arg, item)
    return if arg.nil? || arg.is_a?(Item)

    arg.add_item(item)

    case arg
    when Genre
      @genres << arg
    when Author
      @authors << arg
    when Label
      @labels << arg
    when Source
      @sources << arg
    end
  end
end
