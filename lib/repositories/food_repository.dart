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
  Future<Either<ErrorHandler, List<Food>>> getFood() async {
    try {
      final querySnapshot = _firestore.collection('food').where('isLive', isEqualTo: true).snapshots();
      streamSubscriptions?.cancel();
      streamSubscriptions = null;
      streamSubscriptions = querySnapshot.listen(_listenToFood);
      return const Right([]);
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
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
