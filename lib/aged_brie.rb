class AgedBrie

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.sell_in >= 0 and item.quality < 50
        item.quality = item.quality + 1
      elsif item.sell_in < 0 and item.quality < 50
        item.quality = item.quality + 2
      end
    end
  end

end
