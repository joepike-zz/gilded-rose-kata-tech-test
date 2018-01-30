require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "Non-negative quality" do
      it "should never have an item with negative quality" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
    end

    # need to add a condition that an item cannot have an initial quality over 50
    # unless it is Sulfuras
    context "Quality never more than 50" do
      it "should not allow the quality to be more than 50" do
        items = [Item.new("foo", 0, 70)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "the quality of the appreciating item, 'Aged Brie', cannot exceed 50" do
        items = [Item.new("Aged Brie", 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
    end

    context "Backstage passes" do
      
    end

    # if sell-in set to 0 test fails for aged brie - quality increases by 2
    context "Increasing quality" do
      it "should increase the quality of 'Aged Brie'" do
        items = [Item.new("Aged Brie", 1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(1)
      end
      it "should increase the quality of 'Backstage passes' by 2 for sellin < 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 8)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
      it "should increase the quality of 'Backstage passes' by 3 for sellin < 5" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(9)
      end
    end

    context "Sulfurus" do
      it 'the quality does not change' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
    end



  end

end
