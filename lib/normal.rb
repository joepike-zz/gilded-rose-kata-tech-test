require 'gilded_rose'

class Normal

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if quality_condition(item) and item.sell_in >= 0
        item.quality - 1
      elsif quality_condition and item.sell_in < 0
        item.quality - 2
      end
    end
  end

  def quality_condition(item)
    item.quality >= 0 and item.quality <= 50
  end

end
