import 'package:get/get.dart';

import 'controllers/bindings/controllers_bindings.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: ControllersBindings()),
    GetPage(
      name: '/settings',
      page: () => const SettingsPage(),
      binding: ControllersBindings(),
    ),
  ];
}
