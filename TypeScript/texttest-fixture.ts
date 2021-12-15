import { Item, GildedRose } from './gilded-rose';

console.log('OMGHAI!');

const items = [
  new Item('+5 Dexterity Vest', 10, 20),
  new Item('Aged Brie', 2, 0),
  new Item('Elixir of the Mongoose', 5, 7),
  new Item('Sulfuras, Hand of Ragnaros', 0, 80),
  new Item('Sulfuras, Hand of Ragnaros', -1, 80),
  new Item('Backstage passes to a TAFKAL80ETC concert', 15, 20),
  new Item('Backstage passes to a TAFKAL80ETC concert', 10, 49),
  new Item('Backstage passes to a TAFKAL80ETC concert', 5, 49),
  // This Conjured item does not work properly yet
  new Item('Conjured Mana Cake', 3, 6), // <-- :O
];

let days = 2;
if (process.argv[2]) {
  days = parseFloat(process.argv[2]) + 1;
}

const gildedRose = new GildedRose(items);
for (let day = 0; day < days; day++) {
  console.log('-------- day %d --------', day);
  console.log('name, sellIn, quality');
  items.forEach(item => {
    console.log("%s, %d, %d", item.name, item.sellIn, item.quality);
  });
  console.log();
  gildedRose.updateQuality();
}
