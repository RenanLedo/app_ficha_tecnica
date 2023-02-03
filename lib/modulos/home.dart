import 'package:app_ficha_tecnica/components/card_home.dart';
import 'package:app_ficha_tecnica/modulos/custosFixos/controller/custos_fix_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'receita/controller/receita_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final custsFixController = Get.find<CustosFixController>();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gerencie seu restaurante',
          ),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            GetBuilder<InsumoController>(
              builder: (insumoController) {
                return CardHome(
                  icon: 'assets/images/icon-insumos.png',
                  title: 'Insumos',
                  preQuantidade: 'Quantidade',
                  quantidade: insumoController.insumosList.length.toDouble(),
                  onPress: () => Get.toNamed(PagesRoutes.createInsumos),
                );
              },
            ),
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return CardHome(
                  icon: 'assets/images/icon-receita.png',
                  title: 'Receita',
                  preQuantidade: 'Quantidade',
                  quantidade: 10,
                  onPress: () => Get.toNamed(PagesRoutes.receitas),
                );
              },
            ),
            GetBuilder<DespesaController>(
              builder: (despesaController) {
                return CardHome(
                  icon: 'assets/images/icon-despesas.png',
                  title: 'Despesas',
                  preQuantidade: 'Quantidade',
                  quantidade: double.parse(
                      despesaController.despesaList.length.toString()),
                  onPress: () => Get.toNamed(PagesRoutes.createDespesa),
                );
              },
            ),
            GetBuilder<CustosFixController>(
              builder: (custsFixController) {
                return CardHome(
                  icon: 'assets/images/icon-custos.png',
                  title: 'Custos Fixos',
                  preQuantidade: 'Total R\$',
                  quantidade: double.parse(
                      custsFixController.totalCustosFix.toStringAsFixed(2)),
                  onPress: () => Get.toNamed(PagesRoutes.custosFixos),
                );
              },
            ),
          ],
        ));
  }
}
