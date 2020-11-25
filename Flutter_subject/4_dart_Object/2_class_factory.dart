main(List<String> args) {
  final Media shop1 = Media.withName("Air conditioner");
  final Media shop2 = Media.withName("refrigerator");
  final shop3 = Media.withName("refrigerator");
  print(identical(shop1, shop2));
  print(identical(shop2, shop3));

  final airConditoiner1 = Media.withPrice("2999");
  final airConditoiner2 = Media.withPrice("3999");
  final airConditoiner3 = Media.withPrice("3999");
  print(identical(airConditoiner1, airConditoiner2));
  print(identical(airConditoiner2, airConditoiner3));
}

// 普通的构造函数: 会自动返回创建出来的对象, 不能手动的返回
// 工厂构造函数最大的特点: 可以手动的返回一个对象
class Media {
  String shopName;
  String price;

  Media(this.shopName, this.price);

  static final Map<String, Media> _shopNameCache = {};
  static final Map<String, Media> _priceCache = {};

  factory Media.withName(String name) {
    if (_shopNameCache.containsKey(name)) {
      return _shopNameCache[name];
    } else {
      final Media p = Media(name, "2.9");
      _shopNameCache[name] = p;
      return p;
    }
  }
  factory Media.withPrice(String price) {
    if (_priceCache.containsKey(price)) {
      return _priceCache[price];
    } else {
      final Media p = Media("qingqing", price);
      _priceCache[price] = p;
      return p;
    }
  }
}
