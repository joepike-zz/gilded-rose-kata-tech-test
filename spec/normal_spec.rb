# require 'gilded_rose'
# require 'normal'
#
# describe Normal do
#
#   context "'Normal' items" do
#     it "an item should never have negative quality" do
#       items = [Item.new("foo", 0, 0)]
#       Normal.new(items).update_quality()
#       expect(items[0].quality).to eq(0)
#     end
#     it "should decrease the sell-in date by one" do
#       items = [Item.new("foo", 5, 10)]
#       Normal.new(items).update_quality()
#       expect(items[0].sell_in).to eq(4)
#     end
#     it "should decrease the quality by one" do
#       items = [Item.new("foo", 5, 10)]
#       Normal.new(items).update_quality()
#       expect(items[0].quality).to eq(9)
#     end
#     it "quality should decrease twice as fast for sell-in date < 0 days" do
#       items = [Item.new("foo", -1, 10)]
#       Normal.new(items).update_quality()
#       expect(items[0].quality).to eq(8)
#     end
#     it "quality should decrease twice as fast for sell-in date < 0 days but not below 0 quality" do
#       items = [Item.new("foo", -1, 1)]
#       Normal.new(items).update_quality()
#       expect(items[0].quality).to eq(0)
#     end
#   end
#
# end
