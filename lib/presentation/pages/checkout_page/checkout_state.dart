import 'package:flutter/widgets.dart';
import 'package:foda/core/components/base_state.dart';
import 'package:foda/core/utils/code_generator.dart';
import 'package:foda/core/utils/custom_toast.dart';
import 'package:foda/core/utils/date_time.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/models/order.dart';
import 'package:foda/models/user.dart';
import 'package:foda/repositories/cart_repository.dart';
import 'package:foda/repositories/food_repository.dart';
import 'package:foda/repositories/order_repository.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/get_it.dart';

const int cart = 0;
const int confirm_order = 1;
const int complete_order = 2;
const List<String> paymentMethods = ['Cash', 'Credit Card', 'Paypal'];

class CheckoutState extends BaseState {
  final foodRepository = locate<FoodRepository>();
  final userRepository = locate<UserRepository>();
  final _cartRepository = locate<CartRepository>();
  final _orderRepository = locate<OrderRepository>();

  Map<String, Food> cartItems = {};
  List<CartItem> cart = [];

  String selectedPaymentMethod = 'Cash';
  int currentPage = 0;

  late PageController pageController;
  int totalOrderPrice = 0;

  CheckoutState() {
    pageController = PageController();

    _cartListener();
    _cartRepository.cartNotifier.addListener(_cartListener);
  }
  User get currentUser => userRepository.currentUserNotifier.value!;

  @override
  void dispose() {
    _cartRepository.cartNotifier.removeListener(_cartListener);
    super.dispose();
  }

  void _cartListener() async {
    cart = _cartRepository.cartNotifier.value;
    notifyListeners();

    _cartRepository.cartNotifier.value.forEach((CartItem item) async {
      final getFood = await foodRepository.getFood(item.foodId);
      if (getFood.isRight) {
        final product = getFood.right;
        cartItems[item.foodId] = product;
        notifyListeners();
      }
    });
  }

  void onPageChange(int value) {
    currentPage = value;
    notifyListeners();
  }

  void animateToPage(int page) {
    pageController.jumpToPage(page);
  }

  void setPayment(String value) {
    selectedPaymentMethod = value;
    notifyListeners();
  }

  Future<void> placeOrder() async {
    if (isLoading == false) {
      setLoading(true);
      final result = await _orderRepository.createOrder(currentUser.uid, initializeOrder());
      setLoading(false);
      if (result.isRight) {
        animateToPage(complete_order);
        showCustomToast('Order Placed, Thank you');
      } else {
        showCustomToast('Unable to place the order');
      }
    }
  }

  Orders initializeOrder() {
    totalOrderPrice = getTotalAmount;
    return Orders(
        orderId: CodeGenerator.generateCode('order'),
        uid: currentUser.uid,
        imageUrl: cartItems.values.last.imageUrl,
        createdAt: timeNow(),
        updatedAt: timeNow(),
        totalPrice: getTotalAmount,
        status: 'placed',
        paymentReference: '',
        deliveryMethod: 'home',
        paymentType: selectedPaymentMethod,
        shippingDate: timeNow(),
        orderItems: cart
            .map(
              (cartItem) => OrderItem(
                  foodId: cartItem.foodId,
                  title: cartItems[cartItem.foodId]!.title,
                  quantity: cartItem.quantity,
                  price: cartItems[cartItem.foodId]!.price,
                  createdAt: cartItem.createdAt,
                  updatedAt: cartItem.updatedAt,
                  coverImageUrl: cartItems[cartItem.foodId]!.imageUrl,
                  category: cartItems[cartItem.foodId]!.category),
            )
            .toList());
  }

  void clearCacheCart() {
    cart.clear();
    cartItems.clear();
    totalOrderPrice = 0;
  }

  int get getTotalAmount {
    int total = 0;
    cartItems.forEach((key, value) {
      try {
        final cartItem = cart.firstWhere((item) => item.foodId == key);
        final newFood = value.copyWith(category: cartItem.category);
        total += cartItem.quantity * newFood.price;
      } catch (e) {}
    });
    return total;
  }
}
