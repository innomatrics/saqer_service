import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/screens/customer/welcome_screen/welcome_screen.dart';
import 'package:saqer_services/screens/driver/screens/document%20verification/controller/document_verification_ui_controller.dart';
import 'package:saqer_services/screens/driver/provider/driver_document_provider.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/credit_card_model.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/view%20model/credit_card_provider.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/money/ui%20controller/add_wallet_money_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  //for local storage
  //initial hive and register adapters
  await Hive.initFlutter();
  //register the adapted
  Hive.registerAdapter(CreditCardModelAdapter());
  //these are the storage boxes
  //open the credi card box
  await Hive.openBox<CreditCardModel>(
    'driverCreditcards',
    collection: 'driverCreditcards',
  );
  runApp(
    MultiProvider(
      providers: [
        //ui controller
        ChangeNotifierProvider(
          create: (_) => DocumentVerificationUiController(),
        ),
        ChangeNotifierProvider(create: (_) => AddWalletMoneyController()),
        //provider
        ChangeNotifierProvider(create: (_) => DriverDocumentProvider()),
        ChangeNotifierProvider(create: (_) => CreditCardProvider()),
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
