import 'package:flutter/material.dart';
void main() => runApp(const SilaApp());
class SilaApp extends StatelessWidget {
  const SilaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Sila App شغال ✅', style: TextStyle(fontSize: 28)))),
    );
  }
}
