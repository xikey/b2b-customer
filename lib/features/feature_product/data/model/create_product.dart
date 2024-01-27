class CreateProduct {
  int productId;
  String name;
  bool isActive;

  CreateProduct({
    required this.productId,
    required this.name,
    required this.isActive,
  });

  factory CreateProduct.fromJson(Map<String, dynamic> json) {
    return CreateProduct(
      productId: json['productId'] as int,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['isActive'] = isActive;

    return data;
  }

  @override
  String toString() {
    return 'CreateNewProduct{productId: $productId, name: $name, isActive: $isActive}';
  }
}