import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/modulos/despesas/components/despesa_tile.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DespesaPage extends StatefulWidget {
  // final itemValue = ValueNotifier('');
  const DespesaPage({super.key});

  @override
  State<DespesaPage> createState() => _DespesaPageState();
}

class _DespesaPageState extends State<DespesaPage> {
  final itemsMedida = ['GRAMA', 'PORCENTAGEM', 'UNIDADE'];
  final tituloEC = TextEditingController();
  final custoEC = TextEditingController();

  final despesaController = Get.find<DespesaController>();
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
          'Despesas',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GetBuilder<InsumoController>(
              builder: (insumoController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: tituloEC,
                      icon: Icons.text_snippet,
                      label: 'Titulo',
                    ),
                    CustomTextField(
                      controller: custoEC,
                      icon: Icons.monetization_on_outlined,
                      textInputType: TextInputType.number,
                      label: 'Custo',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Unidade de Medida',
                            prefixIcon: Icon(Icons.stacked_bar_chart_outlined)),
                        isExpanded: true,
                        hint: const Text('Escolha a Medida'),
                        value: (despesaController.itemValue.isEmpty)
                            ? 'UNIDADE'
                            : despesaController.itemValue,
                        onChanged: (escolha) =>
                            despesaController.setItemValue(escolha.toString()),
                        items: itemsMedida
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // double custo = double.parse(custoEC.text);

                          despesaController.addDespesa(
                            Despesa(
                              title: tituloEC.text,
                              price: double.parse(custoEC.text),
                              unidadeMedida: insumoController.itemValue,
                            ),
                          );
                          FocusScope.of(context).unfocus();
                          tituloEC.text = '';
                          custoEC.text = '';
                        },
                        child: const Text('Salvar')),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),

            //area da lista a partri daqui:
            Expanded(
              child: Container(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  child: GetBuilder<DespesaController>(
                    builder: (despesaController) {
                      return despesaController.despesaList.isEmpty
                          ? const Center(
                              child: Text('Não há Insumos Cadastrados'),
                            )
                          : ListView.builder(
                              itemCount: despesaController.despesaList.length,
                              itemBuilder: ((context, index) {
                                final despesaIndex =
                                    despesaController.despesaList[index];
                                return DespesaTile(
                                  despesa: despesaIndex,
                                  onPress: () =>
                                      despesaController.remove(despesaIndex),
                                );
                              }));
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
