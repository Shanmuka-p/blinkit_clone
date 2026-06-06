import 'package:blinkit_clone/domain/models/product_model.dart';
import 'package:blinkit_clone/domain/providers/cart_provider.dart';
import 'package:blinkit_clone/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  // Mock instruction items with icons
  final List<Map<String, dynamic>> _instructionOptions = [
    {"text": "Avoid calling", "icon": Icons.phone_disabled_outlined},
    {"text": "Leave at gate", "icon": Icons.door_sliding_outlined},
    {"text": "Leave with guard", "icon": Icons.security_outlined},
    {"text": "No bell ring", "icon": Icons.notifications_off_outlined},
  ];

  // Mock tip values
  final List<double> _tipOptions = [10.0, 20.0, 30.0, 50.0];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final canPop = Navigator.canPop(context);

    return Scaffold(
      backgroundColor: const Color(0XFFF5F7FB),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0XFFF7CB45), // Brand Yellow
        elevation: 0,
        leading: canPop
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Uihelper.customText(
                      text: "Delivery in 10-12 mins",
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontsize: 16,
                      fontfamily: "bold",
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "FAST",
                        style: TextStyle(
                          color: Color(0XFFF7CB45),
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Uihelper.customText(
                      text: "HOME - Shanmuka Reddy, G.mamidada",
                      color: Colors.black.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      fontsize: 11,
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              child: const Icon(Icons.person_outline, color: Colors.black),
            ),
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? _buildEmptyState(context, cart)
          : Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 12.0, bottom: 100.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Free delivery threshold alert
                          _buildFreeDeliveryProgress(cart),
                          const SizedBox(height: 12),

                          // Cart Items Card
                          _buildCartItemsList(context, cart),
                          const SizedBox(height: 16),

                          // Delivery Instructions
                          _buildInstructionsSection(cart),
                          const SizedBox(height: 16),

                          // Driver Partner Tipping
                          _buildTippingSection(cart),
                          const SizedBox(height: 16),

                          // Promo Coupon Section
                          _buildPromoSection(cart),
                          const SizedBox(height: 16),

                          // Bill Details Invoice
                          _buildBillDetails(cart),
                          const SizedBox(height: 16),

                          // Cancellation Policy Card
                          _buildCancellationCard(),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),

                // Sticky Bottom Payment Bar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildStickyPaymentBar(context, cart),
                ),
              ],
            ),
    );
  }

  // --- EMPTY CART STATE ---
  Widget _buildEmptyState(BuildContext context, CartProvider cart) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/shopping_cart.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Uihelper.customText(
                  text: "Your cart is empty",
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontsize: 20,
                  fontfamily: "bold",
                ),
                const SizedBox(height: 8),
                Uihelper.customText(
                  text: "Add items to start shopping and get last-minute essentials.",
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontsize: 12,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Home tab in SalomanBottomBar (index 0)
                    // If we pushed Cartscreen on top, we just pop. Otherwise, switch tabs.
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      // Switch tab by popping if within nested, or let user click bottom bar.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Browse products on the Home tab!"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Color(0XFF0C831F),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF0C831F),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Start Shopping",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildBestsellersShelf(cart),
        ],
      ),
    );
  }

  // --- BESTSELLERS RECOMMENDATIONS SHELF ---
  Widget _buildBestsellersShelf(CartProvider cart) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Uihelper.customText(
            text: "Popular Bestsellers",
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontsize: 16,
            fontfamily: "bold",
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockProducts.length,
              itemBuilder: (context, index) {
                final product = mockProducts[index];
                final qty = cart.getProductQuantity(product.id);

                return Container(
                  width: 110,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/${product.image}",
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        product.unit,
                        style: TextStyle(fontSize: 8, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
                          ),
                          qty > 0
                              ? Container(
                                  height: 24,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF27AF34),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () => cart.removeFromCart(product),
                                        child: const Icon(Icons.remove, color: Colors.white, size: 10),
                                      ),
                                      Text(
                                        qty.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => cart.addToCart(product),
                                        child: const Icon(Icons.add, color: Colors.white, size: 10),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 24,
                                  width: 45,
                                  child: OutlinedButton(
                                    onPressed: () => cart.addToCart(product),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      side: const BorderSide(color: Color(0XFF27AF34), width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      "ADD",
                                      style: TextStyle(
                                        color: Color(0XFF27AF34),
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // --- FREE DELIVERY PROGRESS INDICATOR ---
  Widget _buildFreeDeliveryProgress(CartProvider cart) {
    double progress = cart.subtotal / 99.0;
    if (progress > 1.0) progress = 1.0;
    bool isFree = cart.subtotal >= 99.0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isFree ? Icons.check_circle : Icons.delivery_dining,
                color: isFree ? const Color(0XFF0C831F) : Colors.amber.shade700,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isFree
                      ? "Congratulations! Your delivery charge is FREE."
                      : "Add ₹${(99.0 - cart.subtotal).toStringAsFixed(0)} more for FREE Delivery",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: isFree ? const Color(0XFF0C831F) : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              color: const Color(0XFF0C831F),
              backgroundColor: Colors.grey.shade100,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  // --- CART ITEMS CARD ---
  Widget _buildCartItemsList(BuildContext context, CartProvider cart) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_bag, color: Color(0XFF0C831F), size: 18),
              const SizedBox(width: 8),
              Uihelper.customText(
                text: "Review Items",
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontsize: 14,
                fontfamily: "bold",
              ),
              const Spacer(),
              Text(
                "${cart.totalItemsCount} item(s)",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cart.items.length,
            separatorBuilder: (context, index) => const Divider(height: 16),
            itemBuilder: (context, index) {
              final item = cart.items.values.elementAt(index);
              final product = item.product;

              return Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      "assets/images/${product.image}",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          product.unit,
                          style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "₹${product.price}",
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                            ),
                            if (product.originalPrice != null) ...[
                              const SizedBox(width: 6),
                              Text(
                                "₹${product.originalPrice}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade400,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0XFF27AF34),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.green.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2)),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white, size: 12),
                          onPressed: () => cart.removeFromCart(product),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item.quantity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white, size: 12),
                          onPressed: () => cart.addToCart(product),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // --- DELIVERY INSTRUCTIONS ---
  Widget _buildInstructionsSection(CartProvider cart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Uihelper.customText(
            text: "Delivery Instructions",
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontsize: 14,
            fontfamily: "bold",
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 75,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _instructionOptions.length,
            itemBuilder: (context, index) {
              final option = _instructionOptions[index];
              final isSelected = cart.instructions.contains(option["text"]);

              return GestureDetector(
                onTap: () => cart.toggleInstruction(option["text"]),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 120,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green.shade50 : Colors.white,
                    border: Border.all(
                      color: isSelected ? const Color(0XFF0C831F) : Colors.grey.shade200,
                      width: isSelected ? 1.5 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        option["icon"],
                        color: isSelected ? const Color(0XFF0C831F) : Colors.grey.shade600,
                        size: 20,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        option["text"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? const Color(0XFF0C831F) : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- DRIVER PARTNER TIPPING ---
  Widget _buildTippingSection(CartProvider cart) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.volunteer_activism_outlined, color: Colors.amber, size: 18),
              const SizedBox(width: 8),
              Uihelper.customText(
                text: "Tip your Delivery Partner",
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontsize: 14,
                fontfamily: "bold",
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "100% of tips go to your delivery partner to support their efforts.",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _tipOptions.map((tip) {
              final isSelected = cart.tipAmount == tip;
              return Expanded(
                child: GestureDetector(
                  onTap: () => cart.setTipAmount(tip),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green.shade50 : Colors.white,
                      border: Border.all(
                        color: isSelected ? const Color(0XFF0C831F) : Colors.grey.shade300,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "₹${tip.toInt()}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? const Color(0XFF0C831F) : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (cart.tipAmount > 0) ...[
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "👏 Thank you! Rider says: Wow, thank you!",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.amber.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // --- PROMO COUPON ---
  Widget _buildPromoSection(CartProvider cart) {
    bool isEligible = cart.subtotal >= 200.0;
    bool isApplied = cart.isCouponApplied;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isApplied ? const Color(0XFF0C831F).withValues(alpha: 0.3) : Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.local_offer_outlined, color: Color(0XFF0C831F), size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Uihelper.customText(
                      text: "Coupon: FREEFAST50",
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontsize: 13,
                      fontfamily: "bold",
                    ),
                    Text(
                      isEligible
                          ? "Get flat ₹50 OFF on orders above ₹200."
                          : "Add ₹${(200.0 - cart.subtotal).toStringAsFixed(0)} more to unlock flat ₹50 OFF",
                      style: TextStyle(
                        fontSize: 10,
                        color: isEligible ? Colors.grey.shade600 : Colors.red.shade700,
                        fontWeight: isEligible ? FontWeight.w500 : FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: isEligible ? () => cart.toggleCoupon() : null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: isApplied
                        ? Colors.red
                        : (isEligible ? const Color(0XFF0C831F) : Colors.grey),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  isApplied ? "REMOVE" : "APPLY",
                  style: TextStyle(
                    color: isApplied
                        ? Colors.red
                        : (isEligible ? const Color(0XFF0C831F) : Colors.grey),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (isApplied) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              color: Colors.green.shade50,
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: Color(0XFF0C831F), size: 14),
                  const SizedBox(width: 6),
                  const Text(
                    "FREEFAST50 applied successfully! Savings: ₹50",
                    style: TextStyle(
                      fontSize: 9.5,
                      color: Color(0XFF0C831F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // --- BILL DETAILS INVOICE ---
  Widget _buildBillDetails(CartProvider cart) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Uihelper.customText(
            text: "Bill Details",
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontsize: 14,
            fontfamily: "bold",
          ),
          const SizedBox(height: 12),

          // Item Total
          _buildBillRow("Items Total (Original)", "₹${cart.originalSubtotal.toStringAsFixed(2)}"),
          const SizedBox(height: 8),

          // Shop Discounts
          if (cart.originalSubtotal - cart.subtotal > 0) ...[
            _buildBillRow(
              "Product Discounts",
              "-₹${(cart.originalSubtotal - cart.subtotal).toStringAsFixed(2)}",
              valueColor: const Color(0XFF0C831F),
            ),
            const SizedBox(height: 8),
          ],

          // Coupon Discount
          if (cart.isCouponApplied) ...[
            _buildBillRow(
              "Promo Discount (FREEFAST50)",
              "-₹50.00",
              valueColor: const Color(0XFF0C831F),
            ),
            const SizedBox(height: 8),
          ],

          // Delivery Charges
          _buildBillRow(
            "Delivery Charges",
            cart.deliveryFee == 0.0 ? "FREE" : "₹${cart.deliveryFee.toStringAsFixed(2)}",
            valueColor: cart.deliveryFee == 0.0 ? const Color(0XFF0C831F) : Colors.black,
            isDelivery: true,
            originalDeliveryFee: 15.0,
          ),
          const SizedBox(height: 8),

          // Handling Fee
          _buildBillRow("Handling Fee", "₹${cart.handlingFee.toStringAsFixed(2)}"),
          const SizedBox(height: 8),

          // Taxes
          _buildBillRow("Taxes & Gov. Charges (5% GST)", "₹${cart.taxesAmount.toStringAsFixed(2)}"),

          // Rider Tip
          if (cart.tipAmount > 0) ...[
            const SizedBox(height: 8),
            _buildBillRow(
              "Driver Partner Tip",
              "₹${cart.tipAmount.toStringAsFixed(2)}",
              valueColor: Colors.amber.shade900,
            ),
          ],

          const Divider(height: 24, thickness: 1),

          // Grand Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Grand Total",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              Text(
                "₹${cart.grandTotal.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillRow(
    String title,
    String value, {
    Color? valueColor,
    bool isDelivery = false,
    double? originalDeliveryFee,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            if (isDelivery && originalDeliveryFee != null && value == "FREE") ...[
              Text(
                "₹${originalDeliveryFee.toStringAsFixed(0)}",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey.shade400,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: valueColor ?? Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- CANCELLATION CARD ---
  Widget _buildCancellationCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.red.shade700, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cancellation Policy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.red.shade900),
                ),
                const SizedBox(height: 2),
                Text(
                  "Orders cannot be cancelled once processed. Please check your delivery address and items carefully before placing the order.",
                  style: TextStyle(fontSize: 9.5, color: Colors.red.shade800, height: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- STICKY PAYMENT BAR ---
  Widget _buildStickyPaymentBar(BuildContext context, CartProvider cart) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹${cart.grandTotal.toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                Text(
                  "TOTAL: ${cart.totalItemsCount} item(s)",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 180,
              child: ElevatedButton(
                onPressed: () => _handlePlaceOrder(context, cart),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF0C831F), // Brand Green
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Place Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- PLACE ORDER FLOW ---
  void _handlePlaceOrder(BuildContext context, CartProvider cart) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return _SuccessOverlay(
          onDismiss: () {
            // Clear the cart
            cart.clearCart();

            // Redirect to home/root
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
    );
  }
}

// --- SUCCESS OVERLAY DIALOG ---
class _SuccessOverlay extends StatefulWidget {
  final VoidCallback onDismiss;

  const _SuccessOverlay({required this.onDismiss});

  @override
  State<_SuccessOverlay> createState() => _SuccessOverlayState();
}

class _SuccessOverlayState extends State<_SuccessOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();

    // Auto-dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent back button dismissal
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Color(0XFF0C831F),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Order Placed Successfully!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Your items are being packed. Delivery partner will reach G.mamidada in 12 minutes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Color(0XFFF7CB45),
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Redirecting back to Home...",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
