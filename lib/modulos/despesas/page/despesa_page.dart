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
            TextFormField(
              controller: _searchEC,
              onChanged: (value) {
                // homeController.searchTitle.value = value;
                // insumoController.valueBusca.value = value;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      _searchEC.clear();
                      // insumoController.valueBusca.value = '';
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(Icons.close)),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.amber,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
