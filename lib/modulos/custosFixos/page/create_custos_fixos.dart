import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/modulos/custosFixos/model/custos_Fixos.dart';
import 'package:app_ficha_tecnica/modulos/custosFixos/components/custo_fixo_tile.dart';
import 'package:app_ficha_tecnica/modulos/custosFixos/controller/custos_fix_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCustosFixos extends StatefulWidget {
  const CreateCustosFixos({super.key});

  @override
  State<CreateCustosFixos> createState() => _CreateCustosFixosState();
}

class _CreateCustosFixosState extends State<CreateCustosFixos> {
  final tituloEC = TextEditingController();
  final valorEC = TextEditingController();

  // final custosFixosController = Get.find<CustosFixController>();
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
            'Custos Fixos',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                CustomTextField(
                  controller: tituloEC,
                  icon: Icons.text_snippet,
                  label: 'Titulo',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: valorEC,
                        icon: Icons.monetization_on_outlined,
                        textInputType: TextInputType.number,
                        label: 'Valor',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 15),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: GetBuilder<CustosFixController>(
                          builder: (custosFixosController) {
                            return ElevatedButton(
                              onPressed: () {
                                custosFixosController.addCustoFixo(
                                  CustosFixos(
                                    title: tituloEC.text,
                                    valor: double.parse(valorEC.text),
                                  ),
                                );
                                custosFixosController.totalCustosFixos();
                                FocusScope.of(context).unfocus();
                                tituloEC.text = '';
                                valorEC.text = '';
                              },
                              child: const Text('Salvar'),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<CustosFixController>(
            builder: (custosFixosController) {
              return Text(
                'Total dos Custos Fixos: R\$ ${custosFixosController.totalCustosFix}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GetBuilder<CustosFixController>(
              builder: (custosFixosController) {
                return Container(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  child: custosFixosController.custosFixosList.isEmpty
                      ? const Center(
                          child: Text('Não há Insumos Cadastrados'),
                        )
                      : ListView.builder(
                          itemCount:
                              custosFixosController.custosFixosList.length,
                          itemBuilder: ((context, index) {
                            final custoFixoIndex =
                                custosFixosController.custosFixosList[index];
                            return CustoFixoTile(
                              custoFixo: custoFixoIndex,
                              // onPress: () {},
                            );
                          })),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
