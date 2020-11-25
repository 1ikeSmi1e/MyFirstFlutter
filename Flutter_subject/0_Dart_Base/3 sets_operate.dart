main(List<String> args) {
  // 1.列表List: [];
  var offers = ["tencent", 232, "dyteDance", "zhognxin"];
  offers.add("ali");

  // 2.集合Set: {};
  var movies = {"星际穿越", "大话西游", "盗梦空间"};
  movies.add("星际穿越");
  print(movies);

  offers.add("ali");
  print(offers);
  offers = Set.from(offers).toList();
  print(offers);

  // 3.映射Map
  var info = {"name": "dandy", "age": 27};
  print(info);
}
