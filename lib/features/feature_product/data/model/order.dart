import 'ordered_product.dart';

class Order {
  List<OrderedProduct> orderedProducts;
  DateTime orderDate;
  // You can add other properties relevant to an order

  Order({
    required this.orderedProducts,
    required this.orderDate,
    // Add other properties as needed
  });

  Map<String, dynamic> toJson() {
    return {
      'orderedProducts': orderedProducts.map((orderedProduct) => orderedProduct.toJson()).toList(),
      'orderDate': orderDate.toIso8601String(), // Convert DateTime to a string
      // Add other properties as needed
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderedProducts: (json['orderedProducts'] as List<dynamic>)
          .map((item) => OrderedProduct.fromJson(item))
          .toList(),
      orderDate: DateTime.parse(json['orderDate']),
      // Add other properties as needed
    );
  }
}
