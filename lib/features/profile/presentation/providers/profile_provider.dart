import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  static const String _nameKey = 'firstaid_user_name';
  static const String emergencyNumber = '123';

  String _name = '';
  String _emergencyContactName = '';
  bool _isLoading = true;

  ProfileProvider() {
    _loadProfile();
  }

  String get name => _name;
  String get emergencyContactName => _emergencyContactName;
  String get emergencyContactPhone => emergencyNumber;
  bool get isLoading => _isLoading;
  bool get hasName => _name.trim().isNotEmpty;

  Future<void> _loadProfile() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      _name = preferences.getString(_nameKey) ?? '';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveName(String name) async {
    final cleanName = name.trim();
    if (cleanName.isEmpty) return;

    _name = cleanName;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_nameKey, cleanName);
    notifyListeners();
  }

  Future<void> updateProfile({
    required String name,
    required String contactName,
  }) async {
    _emergencyContactName = contactName.trim();
    await saveName(name);
  }
}
