import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  try {
    await WidgetsFlutterBinding.ensureInitialized();
    print("WidgetsFlutterBinding.ensureInitialized");
    await dotenv.load(fileName: ".env");
    print("Supabase.initialize");
    await Supabase.initialize(
      url:  dotenv.get('SUPABASE_URL'),
      anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    );

    runApp(MyApp());
  } catch (e) {
    print('Initialization error: $e');
  }
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
