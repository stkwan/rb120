module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

sauce = HotSauce.new

#p sauce.ancestors
p Taste.ancestors
p Orange.ancestors