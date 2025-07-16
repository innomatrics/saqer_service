import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/main%20helper/main_helper.dart';
import 'package:saqer_services/screens/customer/welcome_screen/welcome_screen.dart';
import 'package:saqer_services/screens/driver/screens/document%20verification/controller/document_verification_ui_controller.dart';
import 'package:saqer_services/screens/driver/provider/driver_document_provider.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/ui%20controller/add_credit_card_uicontroller.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/view%20model/credit_card_provider.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/money/ui%20controller/add_wallet_money_controller.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/view%20model/driver_wallet_provider.dart';

void main() {
  MainHelper().allInits();
  runApp(
    MultiProvider(
      providers: [
        //ui controller
        ChangeNotifierProvider(
          create: (_) => DocumentVerificationUiController(),
        ),
        ChangeNotifierProvider(create: (_) => AddWalletMoneyController()),
        ChangeNotifierProvider(create: (_) => AddCreditCardUicontroller()),
        ChangeNotifierProvider(
          create: (_) => DocumentVerificationUiController(),
        ),
        //provider
        ChangeNotifierProvider(create: (_) => DriverDocumentProvider()),
        ChangeNotifierProvider(create: (_) => CreditCardProvider()),
        ChangeNotifierProvider(create: (_) => DriverWalletProvider()),
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
