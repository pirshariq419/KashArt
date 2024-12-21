import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _token = ''; // Placeholder for an authentication token
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // Simulated login function
  Future<void> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

      // Simulate login validation
      if (email == 'test@example.com' && password == 'password') {
        _token = 'mockToken123'; // Set a mock token
        _isAuthenticated = true;
        notifyListeners();
      } else {
        throw 'Invalid email or password'; // Simulate invalid credentials
      }
    } catch (error) {
      throw 'Login failed: $error';
    }
  }

  // Simulated sign-up function
  Future<void> signup(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

      // Simulate a successful sign-up
      _token = 'mockSignupToken456'; // Set a mock token
      _isAuthenticated = true;
      notifyListeners();
    } catch (error) {
      throw 'Sign-up failed: $error';
    }
  }

  // Logout function
  void logout() {
    _token = '';
    _isAuthenticated = false;
    notifyListeners(); // Notify UI of changes
  }

  // Simulated session check (for future extension)
  Future<void> checkSession() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate checking session
    // In a real app, check local storage or API token validity here
    _isAuthenticated = _token.isNotEmpty;
    notifyListeners();
  }
}
