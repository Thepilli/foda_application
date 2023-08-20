import 'package:foda/core/components/base_state.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/repositories/cart_repository.dart';
import 'package:foda/services/get_it.dart';

class FoodDetailState extends BaseState {
  final cartRepository = locate<CartRepository>();
  Food food;
  CartItem? cartItem;

  FoodDetailState(this.food) {
    _listenToCart();
    cartRepository.cartNotifier.addListener(_listenToCart);
  }
  @override
  void dispose() {
    cartRepository.cartNotifier.removeListener(_listenToCart);
    super.dispose();
  }

  _listenToCart() {
    try {
      cartItem = cartRepository.cartNotifier.value.firstWhere((element) => element.foodId == food.id);
    } catch (e) {
      cartItem = null;
    }
    notifyListeners();
  }
}
