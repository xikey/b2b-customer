class DeleteProduct {
  int productId;


  DeleteProduct({
    required this.productId,

  });

  factory DeleteProduct.fromJson(Map<String, dynamic> json) {
    return DeleteProduct(
      productId: json['productId'] as int,

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;

    return data;
  }

  @override
  String toString() {
    return 'CreateNewProduct{productId: $productId }';
  }
}