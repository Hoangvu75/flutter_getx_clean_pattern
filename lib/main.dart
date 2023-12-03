import 'package:example_get_clean/data/source/data_source_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataSourceConfig.init();

  GetMaterialApp getMaterialApp = GetMaterialApp(
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    initialRoute: await Routes.initialRoute,
    getPages: Nav.routes,
    builder: EasyLoading.init(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    ),
  );

  runApp(getMaterialApp);
}
