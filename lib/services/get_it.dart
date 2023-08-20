import 'package:foda/repositories/cart_repository.dart';
import 'package:foda/repositories/food_repository.dart';
import 'package:foda/repositories/order_repository.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeService() {
    getIt.registerSingleton<UserRepository>(UserRepository());
    getIt.registerSingleton<FoodRepository>(FoodRepository());
    getIt.registerSingleton<CartRepository>(CartRepository());
    getIt.registerSingleton<OrderRepository>(OrderRepository());
    getIt.registerSingleton<NavigationService>(NavigationService());
  }
}

T locate<T extends Object>() {
  return GetItService.getIt<T>();
}
