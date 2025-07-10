import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/screens/customer/welcome_screen/welcome_screen.dart';
import 'package:saqer_services/screens/driver/auth/controller/driver_auth_uicontroller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DriverAuthUicontroller()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saqer Services',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const WelcomeScreen(),
    );
  }
}
