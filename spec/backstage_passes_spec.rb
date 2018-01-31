describe BackstagePasses

it "should increase the quality of 'Backstage passes' by 2 for 5 < sellin < 10 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 8)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(10)
end
it "should increase the quality of 'Backstage passes' by 3 for 0 < sellin < 5 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 6)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(9)
end
it "should not allow quality over 50 for > 10 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(50)
end
it "should not allow quality over 50 for sellin <=10 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(50)
end
it "should not allow quality over 50 for sellin <=5 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(50)
end
it "should not allow quality over 50 for sellin <=5 days" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(50)
end
it "quality should be 0 when sellin date is < 0" do
  items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 48)]
  BackstagePasses.new(items).update_quality()
  expect(items[0].quality).to eq(0)
end

end
