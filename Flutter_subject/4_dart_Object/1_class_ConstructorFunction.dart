main(List<String> args) {
  Person p1 = Person("qingqing-Liu");
  print(p1.country + " " + p1.name);

  const Person p2 = Person("qingqing-Liu");
  const Person p3 = Person("qingqing-Liu");
  print(identical(p3, p2));
}

// 重定向构造函数
class Person {
  final String name = "qingqing";
  final String country = "china";
  final sex;

  // Person(String name) : this._internal(name, "china");
  // Person._internal(this.name, this.country): this.sex = "男";

  const Person(this.sex);
}
