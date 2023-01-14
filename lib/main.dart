import 'package:app_ficha_tecnica/pages/custosFixos/controller/custos_fix_controller.dart';
import 'package:app_ficha_tecnica/pages/home.dart';
import 'package:app_ficha_tecnica/pages/insumos/controller/insumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages_routes/app_pages.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Get.put<CustosFixController>(CustosFixController());
  Get.put<InsumoController>(InsumoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Ficha Tecnica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      getPages: AppPages.pages,
    );
  }
}
