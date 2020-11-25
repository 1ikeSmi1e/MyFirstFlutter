main(List<String> args) {
  Person per = Person("name", "china");
  print(per.name + "    " + per.country);

  // Object obj = "why";
  // print(obj.substring(1));

  // // 明确声明
  // dynamic obj1 = 123;
  // print(obj1.substring(1));

  Person qingqing = Person.init("qingQing-Liu", "china", 1.64, age: null);
  Person qingqing2 = Person.init("qingQing-Liu", "china", 1.64);
  print(qingqing2);
}

class Person {
  String name;
  String country;
  double height;
  final age;
  // Person(String name, String country) {
  //   this.name = name;
  //   this.country = country;
  // }

  Person(this.name, this.country, {int age}) : this.age = age ?? 20;
  Person.init(this.name, this.country, this.height, {int age})
      : this.age = age ?? 25;

  Person.fromMap(Map<String, dynamic> map, this.age) {
    this.name = map["name"];
    this.country = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name $country $height $age";
  }
}
