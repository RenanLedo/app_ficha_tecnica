import 'package:app_ficha_tecnica/modulos/custosFixos/controller/custos_fix_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/home/page/home.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/receita/controller/receita_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages_routes/app_pages.dart';
import 'services/custom_theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Get.put<CustosFixController>(CustosFixController());
  Get.put<InsumoController>(InsumoController());
  Get.put<DespesaController>(DespesaController());
  Get.put<ReceitaController>(ReceitaController());
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
      theme: ligthtTheme,
      darkTheme: darkTheme,
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     brightness: Brightness.dark,
      //     seedColor: const Color.fromARGB(255, 10, 160, 10),
      //     background: const Color.fromARGB(255, 36, 36, 36),
      //   ),
      //   appBarTheme: const AppBarTheme(
      //     color: Color.fromARGB(255, 36, 36, 36),
      //   ),
      //   fontFamily: 'Rubik',
      // ),
      home: const Home(),
      getPages: AppPages.pages,
    );
  }
}
