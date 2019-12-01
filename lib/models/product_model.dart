class Product {
  final String productName;
  final String urlPhoto;
  final String price;
  final String description;

  Product({this.productName, this.urlPhoto, this.price, this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['ProductName'],
      urlPhoto: json['UrlPhoto'],
      price: json['Price'],
      description: json['Description'],
    );
  }
}
