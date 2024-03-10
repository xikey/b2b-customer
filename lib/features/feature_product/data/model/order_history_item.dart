import '../../../../config/constants.dart';

class OrderHistoryItem {
  final int productId;
  final double count;
  final String name;
  final int productCode;
  final double salePrice;
  final double fi;
  final double price;

  OrderHistoryItem({
    required this.productId,
    required this.count,
    required this.name,
    required this.productCode,
    required this.salePrice,
    required this.fi,
    required this.price,
  });

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) {
    return OrderHistoryItem(
      productId: json['kala_id'] as int,
      count: json['qtt'] as double,
      name: json['name'] as String,
      productCode: json['Code_Kala'] as int,
      salePrice: json['Price_Foroosh'] as double,
      fi: json['fi'] as double,
      price: json['price'] as double,
    );
  }

  static List<OrderHistoryItem> fromList(List<dynamic> dataList) {
    return dataList.map((data) => OrderHistoryItem.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'OrderItemsDto{kalaId: $productId, qtt: $count, name: $name, codeKala: $productCode, priceForoosh: $salePrice, fi: $fi, price: $price}';
  }

  String getImageUrl() {
    return '${Constants.baseUrl}/images/products/$productId.jpg';
  }
}