import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDespesaPage extends StatelessWidget {
  const CreateDespesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsMedida = ['GRAMA', 'PORCENTAGEM', 'UNIDADE'];
    final tituloEC = TextEditingController();
    final custoEC = TextEditingController();

    final insumoController = Get.find<InsumoController>();
    final despesaController = Get.find<DespesaController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Despesas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetBuilder<InsumoController>(
              builder: (insumoController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
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
                                prefixIcon:
                                    Icon(Icons.stacked_bar_chart_outlined)),
                            isExpanded: true,
                            hint: const Text('Escolha a Medida'),
                            value: (despesaController.itemValue.isEmpty)
                                ? 'UNIDADE'
                                : despesaController.itemValue,
                            onChanged: (escolha) => despesaController
                                .setItemValue(escolha.toString()),
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
                      ],
                    ),
                  ],
                );
              },
            ),
            CustonButton(
                onPress: () {
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
                label: 'Salvar'),
          ],
        ),
      ),
    );
  }
}
