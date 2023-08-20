import 'package:foda/core/components/base_state.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/repositories/cart_repository.dart';
import 'package:foda/repositories/food_repository.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/get_it.dart';

class CartState extends BaseState {
  final foodRepository = locate<FoodRepository>();
  final _cartRepository = locate<CartRepository>();
  final userRepository = locate<UserRepository>();

  Map<String, Food> cartItems = {};
  List<CartItem> cart = [];

  CartState() {
    _cartListener();
    _cartRepository.cartNotifier.addListener(_cartListener);
  }

  @override
  void dispose() {
    _cartRepository.cartNotifier.removeListener(_cartListener);
    super.dispose();
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

  void removeCartItem(Food food) {
    _cartRepository.removeFoodFromCart(userRepository.currentUserUID!, food);
  }
}
