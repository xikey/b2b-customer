import 'dart:convert';
import 'package:b2b_customer/common/utils/logger.dart';

import '../../features/feature_product/data/model/ordered_product.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

class Basket {
  late SharedPreferences sharedPreferences;

  Basket() {
    sharedPreferences = locator<SharedPreferences>();
  }

  // Add an ordered product to the basket
  addOrderedProduct(OrderedProduct orderedProduct) async {
    List<String> basketItems =
        sharedPreferences.getStringList('basketItems') ?? [];
    ZikeyLogger.showLog("basketItems", basketItems.toString());
    // Check if the product already exists in the basket
    bool productExists = false;
    double newOrderCount = orderedProduct.orderCount;

    for (int i = 0; i < basketItems.length; i++) {
      OrderedProduct existingProduct =
          OrderedProduct.fromJson(json.decode(basketItems[i]));

      // Check if the product codes match
      if (existingProduct.productId == orderedProduct.productId) {
        // Update the order count instead of adding a new product
        newOrderCount += existingProduct.orderCount;
        basketItems[i] = json.encode(OrderedProduct(
          productId: existingProduct.productId,
          orderCount: newOrderCount,
        ).toJson());

        productExists = true;
        break;
      }
    }

    // If the product does not exist, add a new OrderedProduct to the basket
    if (!productExists) {
      basketItems.add(json.encode(orderedProduct.toJson()));
    }

    // Save the updated list to SharedPreferences
    await sharedPreferences.setStringList('basketItems', basketItems);
  }

  // Remove an ordered product from the basket based on the product code
  removeOrderedProduct(int productID) async {
    List<String> basketItems =
        sharedPreferences.getStringList('basketItems') ?? [];

    // Remove the first occurrence of the product code from the list
    basketItems.removeWhere((item) {
      OrderedProduct orderedProduct =
          OrderedProduct.fromJson(json.decode(item));
      return orderedProduct.productId == productID;
    });

    // Save the updated list to SharedPreferences
    await sharedPreferences.setStringList('basketItems', basketItems);
  }

  // Update an ordered product in the basket based on the product code
  updateOrderedProduct(OrderedProduct updatedOrderedProduct) async {
    List<String> basketItems =
        sharedPreferences.getStringList('basketItems') ?? [];

    // Find and update the existing product in the list
    for (int i = 0; i < basketItems.length; i++) {
      OrderedProduct existingProduct =
          OrderedProduct.fromJson(json.decode(basketItems[i]));

      // Check if the product codes match
      if (existingProduct.productId == updatedOrderedProduct.productId) {
        basketItems[i] = json.encode(updatedOrderedProduct.toJson());
        break;
      }
    }

    // Save the updated list to SharedPreferences
    await sharedPreferences.setStringList('basketItems', basketItems);
  }

  // Get the list of ordered products from the basket
  List<OrderedProduct> getBasketItems() {
    List<String> basketItems =
        sharedPreferences.getStringList('basketItems') ?? [];

    // Convert each JSON string back to OrderedProduct and return the list
    return basketItems
        .map((item) => OrderedProduct.fromJson(json.decode(item)))
        .toList();
  }

  clearBasket() async {
    await sharedPreferences.remove('basketItems');
  }
}
