class ProductModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  int? categoryId;
  String? categoryName;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.price,
      this.categoryId,
      this.categoryName});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["imageURL"] is String) {
      imageUrl = json["imageURL"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["categoryID"] is int) {
      categoryId = json["categoryID"];
    }
    if (json["categoryName"] is String) {
      categoryName = json["categoryName"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["imageURL"] = imageUrl;
    _data["price"] = price;
    _data["categoryID"] = categoryId;
    _data["categoryName"] = categoryName;
    return _data;
  }
}
