import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    Hive.registerAdapter(CreditCardModelAdapter());
    //these box are storing the data
    //also used encryption
    final encyption = await getEncryptionKey();
    //open the credi card box
    await Hive.openBox<DriverCreditCardModel>(
      'driverCreditCards',
      collection: "driverCreditcards",
      encryptionCipher: HiveAesCipher(encyption),
    );
  }

  Future<List<int>> getEncryptionKey() async {
    const secureStorage = FlutterSecureStorage();
    const keyName = 'driverCreditCards';

    String? encodedKey = await secureStorage.read(key: keyName);

    if (encodedKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: keyName, value: key.join(','));
      return key;
    } else {
      return encodedKey.split(',').map(int.parse).toList();
    }
  }
}
