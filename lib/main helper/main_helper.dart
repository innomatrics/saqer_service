import 'package:hive_flutter/hive_flutter.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/driver_credit_card_model.dart';

class MainHelper {
  void allInits() async {
    //firebase initializations
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();

    //hive initializations
    await Hive.initFlutter();
    //register the adaptors
    Hive.registerAdapter(DriverCreditCardModelAdapter());
    //these box are storing the data
    //open the credi card box
    await Hive.openBox<DriverCreditCardModel>(
      'driverCreditCards',
      collection: "driverCreditcards",
    );
  }
}
