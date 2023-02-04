import 'package:app_ficha_tecnica/components/card_home.dart';
import 'package:app_ficha_tecnica/modulos/custosFixos/controller/custos_fix_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/home/components/logo.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../receita/controller/receita_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final custsFixController = Get.find<CustosFixController>();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(children: [
          const Logo(),
          GetBuilder<InsumoController>(
            builder: (insumoController) {
              return CardHome(
                icon: 'assets/images/icon-insumos.png',
                title: 'Insumos',
                preQuantidade: 'Quantidade: ',
                quantidadeUnd: insumoController.insumosList.length,
                onPress: () => Get.toNamed(PagesRoutes.insumos),
              );
            },
          ),
          GetBuilder<DespesaController>(
            builder: (despesaController) {
              return CardHome(
                icon: 'assets/images/icon-despesas.png',
                title: 'Despesas',
                preQuantidade: 'Quantidade: ',
                quantidadeUnd: despesaController.despesaList.length,
                onPress: () => Get.toNamed(PagesRoutes.createDespesa),
              );
            },
          ),
          GetBuilder<ReceitaController>(
            builder: (receitaController) {
              return CardHome(
                icon: 'assets/images/icon-receita.png',
                title: 'Receita',
                preQuantidade: 'Quantidade: ',
                quantidadeUnd: 10,
                onPress: () => Get.toNamed(PagesRoutes.receitas),
              );
            },
          ),
          GetBuilder<CustosFixController>(
            builder: (custsFixController) {
              return CardHome(
                icon: 'assets/images/icon-custos.png',
                title: 'Custos Fixos',
                preQuantidade: 'Total: ',
                quantidadeRs: double.parse(
                    custsFixController.totalCustosFix.toStringAsFixed(2)),
                onPress: () => Get.toNamed(PagesRoutes.custosFixos),
              );
            },
          ),
        ]),
      ),
    ));
  }
}
