import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
import 'package:app_ficha_tecnica/modulos/despesas/components/despesa_tile.dart';
import 'package:app_ficha_tecnica/modulos/despesas/controller/despesa_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
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

  final _searchEC = TextEditingController();

  final despesaController = Get.find<DespesaController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustonButton(
                onPress: () => Get.toNamed(PagesRoutes.createDespesa),
                label: 'Adicionar Insumo'),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _searchEC,
              label: 'Pesquise aqui...',
              suffixIcon: Icons.search,
              onChanged: (value) => despesaController.setListFiltered(value),
            ),

            //area da lista a partri daqui:
            Expanded(
              child: GetBuilder<DespesaController>(
                builder: (despesaController) {
                  return despesaController.despesaList.isEmpty
                      ? const Center(
                          child: Text('Não há Insumos Cadastrados'),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: despesaController.despesaListSeach.length,
                          itemBuilder: ((context, index) {
                            final despesaIndexFilter =
                                despesaController.despesaListSeach[index];
                            return DespesaTile(
                              despesa: despesaIndexFilter,
                              onPress: () =>
                                  despesaController.remove(despesaIndexFilter),
                            );
                          }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
