main(List<String> args) {
  // 学习dart运算符
  var name = null;
  name ??= "james";
  print(name);
  name ??= "wade";
  print(name);

  var height = null;
  var height2 = height ?? 165;
  print(height2);

  height = 175;
  height2 = height ?? 165;
  print(height2);
}
