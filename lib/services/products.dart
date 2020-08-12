int productsDataCallCount = 0;

//simulate product data flow from json service
get productsData {
  productsDataCallCount++;
  switch (productsDataCallCount) {
    case 1:
      return productsData1;
    case 2:
      return productsData2;
    default:
      return productsData3;
  }
}

var productsData1 = {
  "items": [
    {"id": 1, "title": 'iPad 4 Mini', "image": 0xe331, "price": 500.01, "inventory": 2},
    {"id": 2, "title": 'H&M T-Shirt White', "image": 0xe7fd, "price": 10.99, "inventory": 10},
    {"id": 3, "title": 'Charli XCX - Sucker CD', "image": 0xe019, "price": 19.99, "inventory": 5}
  ]
};

var productsData2 = {
  "items": [
    {
      "id": 4,
      "title": 'Su Computer - 4xCore - 8GB',
      "image": 0xe30a,
      "price": 749.99,
      "inventory": 7
    },
    {"id": 5, "title": 'Hava TV - Full HD', "image": 0xe333, "price": 999.01, "inventory": 3},
  ]
};

var productsData3 = {"items": []};
