import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/receita/controller/receita_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceitasPage extends StatelessWidget {
  const ReceitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Receitas',
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustonButton(
                onPress: () => Get.toNamed(PagesRoutes.addReceitas),
                label: 'Criar Receita'),
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: receitaController.receitaList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(receitaController.receitaList[index].title),
                          Text(receitaController.receitaList[index].custoReceita
                              .toString())
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
