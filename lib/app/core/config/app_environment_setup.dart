import 'app_setup.dart';
import 'environment.dart';

abstract class AppEnvironmentSetup {
  static const Environment environment = Environment.production;

  static const AppSetup appSetup = AppSetup(
    isDebugPrint: false,
    isDioLogger: true,
    isDebugPayment: false,
  );
}
