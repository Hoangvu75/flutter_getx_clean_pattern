import 'package:example_get_clean/data/data_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'domain/domain_config.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataConfig.init();
  DomainConfig.init();

  GetMaterialApp getMaterialApp = GetMaterialApp(
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    initialRoute: await Routes.initialRoute,
    getPages: Nav.routes,
    builder: EasyLoading.init(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(
              1.0,
            ),
          ),
          child: child!,
        );
      },
    ),
  );

  runApp(getMaterialApp);
}
