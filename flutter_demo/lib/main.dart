import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: ".env"); // .env ファイルを読み込む

  // await Supabase.initialize(
  //   url: dotenv.get('SUPABASE_URL'), // .env から URL を取得
  //   anonKey: dotenv.get('SUPABASE_ANON_KEY'), // .env から anonKey を取得
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
