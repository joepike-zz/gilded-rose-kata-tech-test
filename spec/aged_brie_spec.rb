require 'aged_brie'
require 'gilded_rose'

describe AgedBrie do

    it "the quality should increase (up to 50)" do
      items = [Item.new("Aged Brie", 1, 0)]
      AgedBrie.new(items).update_quality()
      expect(items[0].quality).to eq(1)
    end
    it "the quality cannot exceed 50" do
      items = [Item.new("Aged Brie", 1, 50)]
      AgedBrie.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it "should increase quality by 2 if sell-in below 0" do
      items = [Item.new("Aged Brie", -1, 10)]
      AgedBrie.new(items).update_quality()
      expect(items[0].quality).to eq(12)
    end

end
