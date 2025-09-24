
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/login_screen.dart';

// import '../ views/introduction_screen.dart';

class SessionManager {
  static const String _tokenKey = 'token';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _emailKey = 'email';
  static const String _profileImageKey = 'profile_image';

  // Save login session
  static Future<void> saveUserSession(Map<String, dynamic> responseData) async {
    final prefs = await SharedPreferences.getInstance();

    final user = responseData['data'];
    final token = responseData['token'];

    await prefs.setString(_tokenKey, token);
    await prefs.setInt(_userIdKey, user['id']);
    await prefs.setString(_userNameKey, user['name']);
    await prefs.setString(_emailKey, user['email']);
    await prefs.setString(_profileImageKey, user['profile_image'] ?? '');

    print("✅ Session saved");
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }

  // Get user token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  static Future<String?> getProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_profileImageKey);
  }


  // Logout user
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("🚪 Logged out");
  }
}


Future<void> logout(BuildContext context) async {
  SessionManager sessionManager = SessionManager();
  await SessionManager.clearSession(); // ✅ all saved data clear

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => LoginScreen()),
        (Route<dynamic> route) => false,
  );
}
