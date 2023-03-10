import 'package:app_ficha_tecnica/modulos/custosFixos/page/create_custos_fixos.dart';
import 'package:app_ficha_tecnica/modulos/despesas/page/create_despesa_page.dart';
import 'package:app_ficha_tecnica/modulos/despesas/page/despesa_page.dart';
import 'package:app_ficha_tecnica/modulos/insumos/page/create_insumos_page.dart';
import 'package:app_ficha_tecnica/modulos/insumos/page/insumos_page.dart';
import 'package:app_ficha_tecnica/modulos/receita/page/add_receita.dart';
import 'package:app_ficha_tecnica/modulos/receita/page/receitas_page.dart';
import 'package:get/get.dart';

import '../modulos/home/page/home.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.createInsumos,
      page: () => const CreateInsumosPage(),
    ),
    GetPage(
      name: PagesRoutes.insumos,
      page: () => const InsumosPage(),
    ),
    GetPage(
      name: PagesRoutes.custosFixos,
      page: () => const CreateCustosFixos(),
    ),
    GetPage(
      name: PagesRoutes.receitas,
      page: () => const ReceitasPage(),
    ),
    GetPage(
      name: PagesRoutes.addReceitas,
      page: () => const AddReceita(),
    ),
    GetPage(
      name: PagesRoutes.despesa,
      page: () => const DespesaPage(),
    ),
    GetPage(
      name: PagesRoutes.createDespesa,
      page: () => const CreateDespesaPage(),
    ),
    GetPage(
      name: PagesRoutes.home,
      page: () => const Home(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String createInsumos = '/createInsumos';
  static const String insumos = '/insumos';
  static const String custosFixos = '/custosFixos';
  static const String receitas = '/receitas';
  static const String addReceitas = '/addReceitas';
  static const String despesa = '/despesa';
  static const String createDespesa = '/createDespesa';
  static const String home = '/';
}
