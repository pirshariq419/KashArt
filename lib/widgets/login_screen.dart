import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLogin = true;
  var _isLoading = false;

  Future<void> _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_isLogin) {
      // Login
      try {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<AuthProvider>(context, listen: false)
            .login(email, password);
        Navigator.of(context).pushReplacementNamed('/home'); // Navigate to Home Screen
      } catch (error) {
        // Handle error
        showErrorDialog('Authentication Failed!');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // Signup
      try {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<AuthProvider>(context, listen: false)
            .signup(email, password);
        Navigator.of(context).pushReplacementNamed('/home'); // Navigate to Home Screen
      } catch (error) {
        // Handle error
        showErrorDialog('Signup Failed!');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _submit,
              child: Text(_isLogin ? 'Login' : 'Signup'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin
                  ? 'Create an Account'
                  : 'Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
