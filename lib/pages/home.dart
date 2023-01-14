import 'package:app_ficha_tecnica/components/card_home.dart';
import 'package:app_ficha_tecnica/pages/custosFixos/controller/custos_fix_controller.dart';
import 'package:app_ficha_tecnica/pages/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final custsFixController = Get.find<CustosFixController>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Gerencie seu restaurante',
            style: TextStyle(color: Colors.black54),
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
            CardHome(
              icon: 'assets/images/icon-receita.png',
              title: 'Receita',
              preQuantidade: 'Quantidade',
              quantidade: 10,
              onPress: () {},
            ),
            CardHome(
              icon: 'assets/images/icon-despesas.png',
              title: 'Despesas',
              preQuantidade: 'Quantidade',
              quantidade: 6,
              onPress: () {},
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
