class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product(
      {this.id,
      this.title,
      this.category,
      this.image,
      this.subTitle,
      this.description,
      this.price});

  /// it create an Category from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        image: json["image"],
        subTitle: json["subTitle"],
        description: json["description"],
        price: json["price"]);
  }
}

/// Our demo product
String description =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";
Product product = Product(
    id: "1",
    title: "Wood Frame",
    category: "Chair",
    image: "https://i.imgur.com/sI4GvE6.png",
    subTitle: "Tietion Armchair",
    description: description,
    price: 1600);
