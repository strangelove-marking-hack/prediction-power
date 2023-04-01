import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/auth_service.dart';
import 'app_colors.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    injector.map<AuthService>((i) => AuthService(prefs: preferences),
        isSingleton: true);
    return injector;
  }
}