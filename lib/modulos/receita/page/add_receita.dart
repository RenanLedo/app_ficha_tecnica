import 'package:app_ficha_tecnica/components/custom_icon.dart';
import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/despesas/components/despesa_receita_tile.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/modulos/receita/components/insumosReceitaTile.dart';
import 'package:app_ficha_tecnica/modulos/receita/controller/receita_controller.dart';
import 'package:app_ficha_tecnica/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReceita extends StatefulWidget {
  const AddReceita({super.key});

  @override
  State<AddReceita> createState() => _AddReceitaState();
}

class _AddReceitaState extends State<AddReceita> {
  final utilsSelvice = UtilsServices();
  final insumoController = Get.find<InsumoController>();
  final despesaController = Get.find<DespesaController>();
  final receitaController = Get.find<ReceitaController>();
  final quantidadeIsumooEC = TextEditingController();
  final quantidadeDespesaEC = TextEditingController();
  final titleEC = TextEditingController();
  final precoVendaEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicione uma Receitas',
        ),
        actions: [
          TextButton(
            onPressed: () {
              quantidadeDespesaEC.text = '';
              quantidadeIsumooEC.text = '';
              titleEC.text = '';
              receitaController.limparTudo();
            },
            child: const Text(
              'Limpar',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextField(
                  controller: titleEC,
                  icon: Icons.title,
                  label: 'Titulo da Receita'),
              GetBuilder<ReceitaController>(
                builder: (receitaController) {
                  return Card(
                    color: const Color.fromARGB(255, 14, 14, 14),
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
                                  controller: quantidadeIsumooEC,
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
                                      double.parse(quantidadeIsumooEC.text);

                                  receitaController.addIsumoForList(
                                      insumo: itemValue,
                                      quantidade: quantidade);
                                  FocusScope.of(context).unfocus();
                                  quantidadeIsumooEC.text = '';
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
                              ? const SizedBox(
                                  height: 30,
                                  child: Text('Nenhum insumo adicionado'),
                                )
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
                    color: const Color.fromARGB(255, 14, 14, 14),
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
                                  controller: quantidadeDespesaEC,
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
                                      double.parse(quantidadeDespesaEC.text);

                                  receitaController.addDespesaForList(
                                      despesa: itemValue,
                                      quantidade: quantidade);
                                  FocusScope.of(context).unfocus();
                                  quantidadeDespesaEC.text = '';
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
                              ? const SizedBox(
                                  height: 30,
                                  child: Text('Nenhuma despesa adicionada'),
                                )
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
              GetBuilder<ReceitaController>(
                builder: (receitaController) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text('Custo da Receita'),
                                Text(
                                  utilsSelvice.priceToCurrency(
                                      receitaController.custoReceitAtual ?? 0),
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Text('Preço de venda'),
                                SizedBox(
                                  width: Get.width / 2,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: precoVendaEC,
                                    onChanged: (value) {
                                      receitaController.calcularMarkup(
                                          double.parse(precoVendaEC.text));
                                      receitaController.calcularMargemLucro(
                                          double.parse(precoVendaEC.text));
                                      receitaController.calcularLucro(
                                          double.parse(precoVendaEC.text));
                                      print(receitaController.lucroReceita);
                                      print(receitaController.markupreceita);
                                      print(
                                          receitaController.margemLucroreceita);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text('Lucro'),
                                Text(
                                  utilsSelvice.priceToCurrency(
                                      receitaController.lucroReceita ?? 0),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Margem Lucro'),
                                Text(
                                  utilsSelvice.porcentagem(
                                      receitaController.margemLucroreceita ??
                                          0),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Markup'),
                                Text(
                                  utilsSelvice.porcentagem(
                                      receitaController.markupreceita ?? 0),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustonButton(
                            onPress: () {
                              receitaController.creatReceita(titleEC.text,
                                  double.parse(precoVendaEC.text));
                              titleEC.text = '';
                              receitaController.limparTudo();
                            },
                            label: 'salvar receita'),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
