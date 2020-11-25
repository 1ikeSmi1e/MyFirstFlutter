main(List<String> args) {
  String name = "zlq";

  var age = 20;
  age = 30;

  final time = DateTime.now();
  const time2 = 2020;

  print("$name + $age + $time + $time2");

  var p0 = Person("var");
  Person p00 = Person("Person");
  final p1 = Person("final"); // final:运行期间确定一个值
  const p2 = const Person("const");
  const p3 = const Person("const");
  const p4 = const Person("const2"); // const:编译期间就要给定一个值，之后不可以改变
  print("$p0 + $p00 + $p1 + $p2+ $p3 + $p4");
  print(identical(p2, p3));
  print(identical(p2, p4));
}

class Person {
  final String name;
  const Person(this.name);

  @override
  String toString() {
    // TODO: implement toString
    return this.name;
  }
}
