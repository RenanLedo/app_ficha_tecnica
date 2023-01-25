import 'package:app_ficha_tecnica/components/custom_icon.dart';
import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/modulos/despesas/components/despesa_receita_tile.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
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
  final despesaController = Get.find<DespesaController>();
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
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              const CustomTextField(
                  icon: Icons.title, label: 'Titulo da Receita'),
              GetBuilder<ReceitaController>(
                builder: (receitaController) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Adicione os insumos da receita'),
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
                                receitaController.setItemInsumoValue(
                                    insumo: escolha);
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Quantidade',
                                  controller: quantidadeEC,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(receitaController
                                          .itemInsumoValue?.unidadeMedida ==
                                      'UNIDADE'
                                  ? 'UNIDADE(S)'
                                  : 'GRAMA(S)'),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomIcon(
                                onPress: () {
                                  var itemValue =
                                      receitaController.itemInsumoValue;
                                  var quantidade =
                                      double.parse(quantidadeEC.text);

                                  receitaController.addIsumoForList(
                                      insumo: itemValue,
                                      quantidade: quantidade);
                                  FocusScope.of(context).unfocus();
                                  quantidadeEC.text = '';
                                  receitaController.itemInsumoValue = null;
                                },
                                radios: 50,
                                backgrounColor:
                                    const Color.fromARGB(255, 144, 214, 255),
                                color: const Color.fromARGB(255, 0, 0, 0),
                                icon: Icons.add,
                                padding: 10,
                              )
                            ],
                          ),
                          receitaController.insumosReceitaList.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                      reverse: true,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: receitaController
                                          .insumosReceitaList.length,
                                      itemBuilder: (context, index) {
                                        final insumoList = receitaController
                                            .insumosReceitaList[index];
                                        return InsumosReceitaTile(
                                          insumo: insumoList,
                                          onPress: () {
                                            return receitaController
                                                .removeInsumoList(insumoList);
                                          },
                                        );
                                      }),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              GetBuilder<ReceitaController>(
                builder: (receitaController) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Adicione as despesas da receita'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonFormField<Despesa>(
                              decoration: const InputDecoration(
                                  labelText: 'Escolha uma Despesa',
                                  prefixIcon: Icon(Icons.food_bank)),
                              isExpanded: true,
                              hint: const Text('Escolha a Despesa'),
                              value:
                                  (receitaController.itemDespesaValue == null)
                                      ? null
                                      : receitaController.itemDespesaValue,
                              onChanged: (escolha) {
                                receitaController.setItemDespesaValue(
                                    despesa: escolha);
                              },
                              items: despesaController.despesaList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.title),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Quantidade',
                                  controller: quantidadeEC,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(receitaController
                                          .itemDespesaValue?.unidadeMedida !=
                                      'PORCENTAGEM'
                                  ? 'UNIDADE(S) OU GRAMA(S)'
                                  : 'PORCENTAGEM'),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomIcon(
                                onPress: () {
                                  var itemValue =
                                      receitaController.itemDespesaValue;
                                  var quantidade =
                                      double.parse(quantidadeEC.text);

                                  receitaController.addDespesaForList(
                                      despesa: itemValue,
                                      quantidade: quantidade);
                                  FocusScope.of(context).unfocus();
                                  quantidadeEC.text = '';
                                  receitaController.itemInsumoValue = null;
                                },
                                radios: 50,
                                backgrounColor:
                                    const Color.fromARGB(255, 144, 214, 255),
                                color: const Color.fromARGB(255, 0, 0, 0),
                                icon: Icons.add,
                                padding: 10,
                              )
                            ],
                          ),
                          receitaController.despesaReceitaList.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                      reverse: true,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: receitaController
                                          .despesaReceitaList.length,
                                      itemBuilder: (context, index) {
                                        final despesaList = receitaController
                                            .despesaReceitaList[index];
                                        return DespesaReceitaTile(
                                          despesa: despesaList,
                                          onPress: () {
                                            return receitaController
                                                .removeDespesaList(despesaList);
                                          },
                                        );
                                      }),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
