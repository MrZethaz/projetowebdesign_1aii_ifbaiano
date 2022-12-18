import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:projeto_webdesign/ProjetoWebDesign.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(ProjetoWebDesign()));
}
