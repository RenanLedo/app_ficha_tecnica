import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/modulos/insumos/model/insumo.dart';
import 'package:app_ficha_tecnica/modulos/components/insumo_tile.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateInsumosPage extends StatefulWidget {
  // final itemValue = ValueNotifier('');
  const CreateInsumosPage({super.key});

  @override
  State<CreateInsumosPage> createState() => _CreateInsumosPageState();
}

class _CreateInsumosPageState extends State<CreateInsumosPage> {
  final itemsMedida = ['GRAMA', 'QUILOGRAMA', 'UNIDADE'];
  final tituloEC = TextEditingController();
  final custoEC = TextEditingController();

  final insumoController = Get.find<InsumoController>();
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
          'Insumos',
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
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // double custo = double.parse(custoEC.text);

                          insumoController.addInsumos(
                            Insumo(
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
                  child: GetBuilder<InsumoController>(
                    builder: (insumoController) {
                      return insumoController.insumosList.isEmpty
                          ? const Center(
                              child: Text('Não há Insumos Cadastrados'),
                            )
                          : ListView.builder(
                              itemCount: insumoController.insumosList.length,
                              itemBuilder: ((context, index) {
                                final insumoIndex =
                                    insumoController.insumosList[index];
                                return InsumoTile(
                                  insumo: insumoIndex,
                                  onPress: () => insumoController.remove(
                                      insumoController.insumosList[index]),
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
