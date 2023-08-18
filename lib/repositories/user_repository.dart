//reposensible for network requests, user DB and user-releted information
// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:foda/core/utils/common.dart';
import 'package:foda/models/result.dart';
import 'package:foda/models/user.dart';
import 'package:foda/services/autherntication_service.dart';

class UserRepository {
  final _authService = AuthenticationService.instance;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  ValueNotifier<User?> currentUserNotifier = ValueNotifier<User?>(null);

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userStreamSubscriptions;

  StreamSubscription? _authStreamSubscription;

  ///listen to user auth
  UserRepository() {
    _listenToAuthChanges();
  }
  void _listenToAuthChanges() {
    _authStreamSubscription?.cancel();
    _authStreamSubscription = null;
    _authStreamSubscription = _authService.authStates().listen((firebaseUser) {
      if (firebaseUser != null) {
        final String uid = firebaseUser.uid;
        getCurrentUser(uid);
        fodaPrint('CURRENT USER >>> $uid');
      } else {
        fodaPrint('NO CURRENT USER');
      }
    });
  }

  //to make sure anytime we call this setter, we get all changes
  set setCurrentUser(User? user) {
    currentUserNotifier.value = user;
    currentUserNotifier.notifyListeners();
  }

  ///register user
  Future<Either<ErrorHandler, User>> registerUser(User user, String password) async {
    try {
      final firebaseUser = await _authService.signUp(user.email, password);
      if (firebaseUser != null) {
        final newUser = user.copyWith(uid: firebaseUser.uid);
        await usersCollection.doc(firebaseUser.uid).set(newUser.toMap());
        await getCurrentUser(firebaseUser.uid);
        return Right(user);
      }
      return const Left(ErrorHandler(message: 'Could not register the user'));
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  ///get user
  Future<Either<ErrorHandler, User>> getCurrentUser(String uid) async {
    try {
      final userSnapshot = await usersCollection.doc(uid).get();
      if (userSnapshot.exists) {
        final data = userSnapshot.data() as Map<String, dynamic>;
        final User user = User.fromMap(data);
        setCurrentUser = user;
        listenToCurrentUser(user.uid);
        return Right(user);
      } else {
        return const Left(ErrorHandler(message: 'User does not exist'));
      }
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  ///login user
  Future<Either<ErrorHandler, User>> loginUser(String email, String password) async {
    try {
      final firebaseUser = await _authService.logIn(email, password);

      if (firebaseUser != null) {
        final getCurrentUserData = await getCurrentUser(firebaseUser.uid);
        if (getCurrentUserData.isRight) {
          return Right(getCurrentUserData.right);
        } else {
          return Left(getCurrentUserData.left);
        }
      }
      return const Left(ErrorHandler(message: "Could not login the user"));
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  ///listen to user
  Stream<User?> listenToCurrentUser(String uid) async* {
    try {
      final snapshots = usersCollection.doc(uid).snapshots();
      _userStreamSubscriptions?.cancel();
      _userStreamSubscriptions = null;
      _userStreamSubscriptions = snapshots.listen((document) {
        if (document.exists) {
          final data = document.data() as Map<String, dynamic>;
          final user = User.fromMap(data);
          setCurrentUser = user;
        }
      });
    } catch (e) {
      fodaPrint(e);
    }

    yield currentUserNotifier.value;
  }
}
