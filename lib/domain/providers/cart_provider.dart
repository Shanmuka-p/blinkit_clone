import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  // Selected driver tip
  double _tipAmount = 0.0;

  // Selected delivery instructions
  final Set<String> _instructions = {};

  // Coupon applied state
  bool _isCouponApplied = false;
  final String couponCode = "FREEFAST50";

  Map<String, CartItem> get items => {..._items};

  CartProvider() {
    // Pre-populate with two default items for demonstration and testing
    final milk = mockProducts.firstWhere((p) => p.id == "milk_1");
    final tomato = mockProducts.firstWhere((p) => p.id == "tomato_1");
    _items[milk.id] = CartItem(product: milk, quantity: 1);
    _items[tomato.id] = CartItem(product: tomato, quantity: 1);
  }

  int get totalItemsCount {
    int total = 0;
    _items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }

  int getProductQuantity(String productId) {
    return _items[productId]?.quantity ?? 0;
  }

  double get subtotal {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.totalPrice;
    });
    return total;
  }

  double get originalSubtotal {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.totalOriginalPrice;
    });
    return total;
  }

  double get discountAmount {
    double priceDiff = originalSubtotal - subtotal;
    return priceDiff + couponDiscountOnly;
  }

  double get couponDiscountOnly {
    if (_isCouponApplied && subtotal >= 200.0) {
      return 50.0;
    }
    return 0.0;
  }

  double get taxesAmount {
    if (_items.isEmpty) return 0.0;
    return double.parse((subtotal * 0.05).toStringAsFixed(2));
  }

  double get handlingFee {
    if (_items.isEmpty) return 0.0;
    return 2.0; // Flat ₹2 fee
  }

  double get deliveryFee {
    if (_items.isEmpty) return 0.0;
    if (subtotal >= 99.0) {
      return 0.0; // Free above ₹99
    }
    return 15.0; // Flat ₹15 charge
  }

  double get tipAmount => _tipAmount;

  Set<String> get instructions => _instructions;

  bool get isCouponApplied => _isCouponApplied;

  double get grandTotal {
    if (_items.isEmpty) return 0.0;
    double total = subtotal + taxesAmount + handlingFee + deliveryFee + _tipAmount - couponDiscountOnly;
    return double.parse(total.toStringAsFixed(2));
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (!_items.containsKey(product.id)) return;

    if (_items[product.id]!.quantity > 1) {
      _items[product.id]!.quantity -= 1;
    } else {
      _items.remove(product.id);
    }

    if (_isCouponApplied && subtotal < 200.0) {
      _isCouponApplied = false;
    }

    notifyListeners();
  }

  void removeItemCompletely(Product product) {
    _items.remove(product.id);
    if (_isCouponApplied && subtotal < 200.0) {
      _isCouponApplied = false;
    }
    notifyListeners();
  }

  void toggleInstruction(String instruction) {
    if (_instructions.contains(instruction)) {
      _instructions.remove(instruction);
    } else {
      _instructions.add(instruction);
    }
    notifyListeners();
  }

  void setTipAmount(double amount) {
    if (_tipAmount == amount) {
      _tipAmount = 0.0; // Toggle off
    } else {
      _tipAmount = amount;
    }
    notifyListeners();
  }

  void toggleCoupon() {
    if (subtotal >= 200.0) {
      _isCouponApplied = !_isCouponApplied;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _tipAmount = 0.0;
    _instructions.clear();
    _isCouponApplied = false;
    notifyListeners();
  }
}
