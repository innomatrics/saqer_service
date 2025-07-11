import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/screens/customer/welcome_screen/welcome_screen.dart';
import 'package:saqer_services/screens/driver/document%20verification/controller/document_verification_ui_controller.dart';
import 'package:saqer_services/screens/driver/provider/driver_document_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //ui controller
        ChangeNotifierProvider(
          create: (_) => DocumentVerificationUiController(),
        ),
        //provider
        ChangeNotifierProvider(create: (_) => DriverDocumentProvider()),
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
