require 'gilded_rose'

class Normal

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in = item.sell_in - 1
      if item.sell_in < 0
        item.quality - 2
      else
        item.quality - 1
      end
    end
  end
  
end
