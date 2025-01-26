import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      // The auth schema is a dedicated schema for storing database objects (tables, functions, etc.) related to the authentication functionality provided by Supabase.

      // The users table resides within the auth schema and stores user authentication information (email address, password hash, authentication provider information, etc.).

      // final response = await Supabase.instance.client.auth.signInWithPassword(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );

      Navigator.pushReplacementNamed(context, '/home');

      // public.users テーブルから email と password を照会
      final response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('email', _emailController.text)
          .eq('password', _passwordController.text)
          .single();

      if (response != null) {
        // ログイン成功
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // 認証失敗
        print('Invalid email or password');
      }

      // if (response.session != null) {
      //   // ログイン成功
      //   Navigator.pushReplacementNamed(context, '/home');
      // }
    } catch (e) {
      // エラーハンドリング
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
