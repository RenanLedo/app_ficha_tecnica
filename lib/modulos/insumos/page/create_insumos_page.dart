import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class CreateInsumosPage extends StatefulWidget {
  // final itemValue = ValueNotifier('');
  const CreateInsumosPage({super.key});

  @override
  State<CreateInsumosPage> createState() => _CreateInsumosPageState();
}

class _CreateInsumosPageState extends State<CreateInsumosPage> {
  final itemsMedida = ['GRAMA', 'QUILOGRAMA', 'UNIDADE'];
  final _tituloEC = TextEditingController();
  final _custoEC = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final _formKey = GlobalKey<FormState>();

  final insumoController = Get.find<InsumoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insumos',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GetBuilder<InsumoController>(
              builder: (insumoController) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: _tituloEC,
                        icon: Icons.text_snippet,
                        label: 'Titulo',
                        validator: Validatorless.required('Titulo Obrigatório'),
                      ),
                      CustomTextField(
                        controller: _custoEC,
                        icon: Icons.monetization_on_outlined,
                        textInputType: TextInputType.number,
                        label: 'Custo',
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo Obrigatório'),
                        ]),
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
                          value: (insumoController.itemValue.isEmpty)
                              ? 'GRAMA'
                              : insumoController.itemValue,
                          onChanged: (escolha) =>
                              insumoController.setItemValue(escolha.toString()),
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
                );
              },
            ),
            CustonButton(
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    insumoController.addInsumos(
                      Insumo(
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
    );
  }
}
