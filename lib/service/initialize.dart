import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zamjy/service/Auth.service.dart';

class Initialize with ChangeNotifier {
  Initialize() {
    _getUserFromStorage();
    _storage;
  }
  late dynamic _userAccount = "";
  final dynamic _storage = const FlutterSecureStorage();

  dynamic get user => _userAccount;

  set user(dynamic value) {
    _userAccount = value;
    notifyListeners();
  }

  Future<void> _getUserFromStorage() async {
    user = await _storage.read(key: "auth");
    notifyListeners();
  }

  Future<void> removeUserStorage() async {
    await _storage.deleteAll();
    user = "";
    notifyListeners();
  }

  Future<void> initializeLoginUser(String email, String password) async {
    final response = await loginUser(email, password);
    if (response.bodyBytes.isNotEmpty) {
      await _storage.write(key: "auth", value: response.body);
      _getUserFromStorage();
      notifyListeners();
    }
  }

  updateUserNotifier() {
    _getUserFromStorage();
    notifyListeners();
  }
}
