main(List<String> args) {
  Media company = Media("34");
  company.setShareprice = "72";

  print(company.getSharePrice);

  Media company1 = MediaElectric("CEO", "66666");
  company1.setShareprice = "50";
  print(company1.getSharePrice);
  // 可以继承父类的属性和方法;

  final subCompany = MediaElectric("CEO", "66666");
  print(subCompany.sharePrice + subCompany.CEO);
}

class Media {
  String sharePrice; // 股价

  set setShareprice(price) => this.sharePrice = price;
  String get getSharePrice => sharePrice;

  Media(this.sharePrice);
}

class MediaElectric extends Media {
  String CEO;

  MediaElectric(this.CEO, String price) : super(price);
}
