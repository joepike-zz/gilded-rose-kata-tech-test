require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context "'Normal' items" do
      it "should never have an item with negative quality" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
      it "should decrease the sell-in date by one" do
        items = [Item.new("foo", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(4)
      end
      it "should decrease the quality by one" do
        items = [Item.new("foo", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(9)
      end
      it "quality should decrease twice as fast for sell-in date < 0 days" do
        items = [Item.new("foo", -1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(8)
      end
      it "quality should decrease twice as fast for sell-in date < 0 days but not below 0 quality" do
        items = [Item.new("foo", -1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
    end

    context "Aged Brie" do
      it "the quality should increase (up to 50)" do
        items = [Item.new("Aged Brie", 1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(1)
      end
      it "the quality cannot exceed 50" do
        items = [Item.new("Aged Brie", 1, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "should increase quality by 2 if sell-in below 0" do
        items = [Item.new("Aged Brie", -1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(12)
      end
    end

    context "Backstage passes" do
      it "should increase the quality of 'Backstage passes' by 2 for 5 < sellin < 10 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 8)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
      it "should increase the quality of 'Backstage passes' by 3 for 0 < sellin < 5 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(9)
      end
      it "should not allow quality over 50 for > 10 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "should not allow quality over 50 for sellin <=10 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "should not allow quality over 50 for sellin <=5 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "should not allow quality over 50 for sellin <=5 days" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(50)
      end
      it "quality should be 0 when sellin date is < 0" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 48)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(0)
      end
    end

    context "Sulfuras" do
      it 'the quality does not change' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(10)
      end
      it 'the sellin does not change' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(10)
      end
      it "the quality of Sulfuras can exceed 50" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 70)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq(70)
      end
    end

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    # need to add a condition that an item cannot have an initial quality over 50
    # unless it is Sulfuras
    # context "Quality never more than 50" do
    #   it "should not allow the initial quality to be more than 50" do
    #     items = [Item.new("foo", 0, 70)]
    #     GildedRose.new(items).update_quality()
    #     expect(items[0].quality).to eq(50)
    #   end
    # end

  end

end
