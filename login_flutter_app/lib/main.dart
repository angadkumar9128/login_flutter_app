import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _saveToFile(String username, String password) {
    File file = File('user_credentials.txt');
    file.writeAsStringSync('Username: $username\nPassword: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                _saveToFile(username, password);

                // Clear the fields after saving
                _usernameController.clear();
                _passwordController.clear();

                // Display a confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Credentials saved to file.')),
                );
              },
              child: Text('Login and Save'),
            ),
          ],
        ),
      ),
    );
  }
}
