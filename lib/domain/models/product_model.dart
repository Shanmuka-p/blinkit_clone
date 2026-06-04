class Product {
  final String id;
  final String title;
  final String image;
  final double price;
  final double? originalPrice;
  final String unit;

  const Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.originalPrice,
    required this.unit,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
  double get totalOriginalPrice => (product.originalPrice ?? product.price) * quantity;
}

final List<Product> mockProducts = [
  // Bestsellers in Cartscreen
  const Product(
    id: "milk_1",
    title: "Amul Taaza Toned Fresh Milk",
    image: "dairy.png",
    price: 27,
    originalPrice: 28,
    unit: "500 ml",
  ),
  const Product(
    id: "veg_1",
    title: "Fresh Vegetables Mix Combo",
    image: "vegetable.png",
    price: 45,
    originalPrice: 60,
    unit: "1 kg",
  ),
  const Product(
    id: "tomato_1",
    title: "Hybrid Fresh Tomatoes",
    image: "tomato.png",
    price: 20,
    originalPrice: 30,
    unit: "500 g",
  ),
  // Bestsellers/Diwali in Homescreen
  const Product(
    id: "candle_1",
    title: "Golden Glass Wooden Lid Candle",
    image: "deep.png",
    price: 79,
    originalPrice: 99,
    unit: "1 unit",
  ),
  const Product(
    id: "sweets_1",
    title: "Royal Gulab Jamun By Bikano",
    image: "home_sweets.png",
    price: 149,
    originalPrice: 199,
    unit: "1 kg",
  ),
  const Product(
    id: "bhujia_1",
    title: "Bikaji Bhujia Premium Pack",
    image: "banner.png",
    price: 79,
    originalPrice: 99,
    unit: "1 kg",
  ),
];
