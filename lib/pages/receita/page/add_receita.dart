import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/models/insumo.dart';
import 'package:app_ficha_tecnica/pages/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/pages/receita/controller/receita_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReceita extends StatefulWidget {
  const AddReceita({super.key});

  @override
  State<AddReceita> createState() => _AddReceitaState();
}

class _AddReceitaState extends State<AddReceita> {
  final insumoController = Get.find<InsumoController>();
  final receitaController = Get.find<ReceitaController>();
  final quantidadeEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Voltar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          title: const Text(
            'Adicione uma Receitas',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextField(
                icon: Icons.title, label: 'Titulo da Receita'),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonFormField<Insumo>(
                decoration: const InputDecoration(
                    labelText: 'Escolha um Insumo',
                    prefixIcon: Icon(Icons.food_bank)),
                isExpanded: true,
                hint: const Text('Escolha o Insumo'),
                value: (receitaController.itemInsumoValue == null)
                    ? null
                    : receitaController.itemInsumoValue,
                onChanged: (escolha) {
                  // if (escolha != null) {
                  //   receitaController.addIsumoForList(escolha);
                  // }
                  receitaController.setItemInsumoValue(escolha);
                  print(receitaController.itemInsumoValue?.unidadeMedida);
                },
                items: insumoController.insumosList
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.title),
                      ),
                    )
                    .toList(),
              ),
            ),
            CustomTextField(
              icon: Icons.numbers,
              label: 'Quantidade',
              controller: quantidadeEC,
            ),
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(receitaController.itemInsumoValue?.unidadeMedida ==
                            'UNIDADE'
                        ? 'UNIDADE(S)'
                        : 'GRAMA(S)'),
                    ElevatedButton(
                        onPressed: () {
                          final quantidade = double.parse(quantidadeEC.text);
                           receitaController.itemInsumoValue?.custoUnd =
                              receitaController
                                      .itemInsumoValue!.custoInReceita! *
                                  quantidade;
                          print(receitaController
                              .itemInsumoValue?.custoInReceita);
                          receitaController.addIsumoForList(
                              receitaController.itemInsumoValue);
                        },
                        child: const Text('Adicionar Insumo'))
                  ],
                );
              },
            ),
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: receitaController.insumosReceitaList.length,
                    itemBuilder: (context, index) {
                      return Text(
                          '${receitaController.insumosReceitaList[index].title} - ${receitaController.insumosReceitaList[index].custoInReceita}');
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
