require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do



    context "Backstage passes" do
      
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
