import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/modulos/despesas/model/despesa.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class CreateDespesaPage extends StatefulWidget {
  const CreateDespesaPage({super.key});

  @override
  State<CreateDespesaPage> createState() => _CreateDespesaPageState();
}

class _CreateDespesaPageState extends State<CreateDespesaPage> {
  final _tituloEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final _custoEC = TextEditingController();

  final _custoEC =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  final itemsMedida = ['GRAMA', 'PORCENTAGEM', 'UNIDADE'];

  final insumoController = Get.find<InsumoController>();
  final despesaController = Get.find<DespesaController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Despesas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
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
                            controller: _tituloEC,
                            icon: Icons.text_snippet,
                            label: 'Titulo',
                            validator:
                                Validatorless.required('Campo Obrigatório'),
                          ),
                          CustomTextField(
                            controller: _custoEC,
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

                    if (_formKey.currentState!.validate()) {
                      despesaController.addDespesa(
                        Despesa(
                          title: _tituloEC.text,
                          price: UtilBrasilFields.converterMoedaParaDouble(
                              _custoEC.text),
                          unidadeMedida: insumoController.itemValue,
                        ),
                      );
                      FocusScope.of(context).unfocus();
                      _tituloEC.text = '';
                      _custoEC.text = '';
                    }
                  },
                  label: 'Salvar'),
            ],
          ),
        ),
      ),
    );
  }
}
