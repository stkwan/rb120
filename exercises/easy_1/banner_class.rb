class Banner
  
  def initialize(message, width = message.size + 2)
    @message = message
    @width = width
  end

  def to_s
    return "Width must be greater or equal to the length of the message!" if @width < @message.size
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end


  private

  def horizontal_rule
    dashes = "-" * @width
    "+#{dashes}+"
  end

  def empty_line
    spaces = " " * @width
    "|#{spaces}|"
  end

  def message_line
    "|#{@message.center(@width)}|"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 60)
puts banner


=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end