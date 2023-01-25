import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/modulos/receita/components/insumosReceitaTile.dart';
import 'package:app_ficha_tecnica/modulos/receita/controller/receita_controller.dart';
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
                  receitaController.setItemInsumoValue(insumo: escolha);
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
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        icon: Icons.numbers,
                        label: 'Quantidade',
                        controller: quantidadeEC,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    Text(receitaController.itemInsumoValue?.unidadeMedida ==
                            'UNIDADE'
                        ? 'UNIDADE(S)'
                        : 'GRAMA(S)'),
                    ElevatedButton(
                        onPressed: () {
                          var itemValue = receitaController.itemInsumoValue;
                          var quantidade = double.parse(quantidadeEC.text);

                          receitaController.addIsumoForList(
                              insumo: itemValue, quantidade: quantidade);
                        },
                        child: const Text('Adicionar Insumo'))
                  ],
                );
              },
            ),
            GetBuilder<ReceitaController>(
              builder: (receitaController) {
                return SizedBox(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: receitaController.insumosReceitaList.length,
                      itemBuilder: (context, index) {
                        final insumoReceitaList = receitaController
                            .insumosReceitaList.reversed
                            .toList()[index];
                        return InsumosReceitaTile(
                          insumo: insumoReceitaList,
                          onPress: () {},
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
