// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:foda/models/food.dart';
import 'package:foda/models/result.dart';

class FoodRepository {
  final _firestore = FirebaseFirestore.instance;

  ValueNotifier<List<Food>> foodNotifier = ValueNotifier<List<Food>>([]);

  StreamSubscription? streamSubscriptions;

  Future<Either<ErrorHandler, List<Food>>> getFoodItems() async {
    try {
      final querySnapshot = _firestore.collection('food').where('asLive', isEqualTo: true).snapshots();
      streamSubscriptions?.cancel();
      streamSubscriptions = null;
      streamSubscriptions = querySnapshot.listen(_listenToFood);
      return const Right([]);
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  Future<Either<ErrorHandler, Food>> getFood(String foodId) async {
    try {
      final food = foodNotifier.value.firstWhere((food) => food.id == foodId);
      return Right(food);
    } catch (e) {
      try {
        if (foodId.isEmpty) {
          return const Left(ErrorHandler(message: 'No food Id found...'));
        }
        final productSnapshot = await _firestore.doc(foodId).get();
        if (productSnapshot.exists) {
          final food = Food.fromMap(productSnapshot.data() as Map<String, dynamic>);
          foodNotifier.value.add(food);
          foodNotifier.notifyListeners();
          return Right(food);
        }
        return const Left(ErrorHandler(message: "Error"));
      } on FirebaseException catch (e) {
        return Left(ErrorHandler(message: e.message ?? ''));
      }
    }
  }

  void _listenToFood(QuerySnapshot<Map<String, dynamic>> snapshot) {
    for (var document in snapshot.docs) {
      final food = Food.fromMap(document.data());
      final index = foodNotifier.value.indexWhere((element) => element.id == food.id);

      if (index != -1) {
        foodNotifier.value.removeAt(index);
        foodNotifier.value.insert(index, food);
      } else {
        foodNotifier.value.add(food);
      }

      foodNotifier.notifyListeners();
    }
  }
}
