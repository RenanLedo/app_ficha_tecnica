import 'package:app_ficha_tecnica/modulos/insumos/components/insumo_tile.dart';
import 'package:app_ficha_tecnica/modulos/insumos/controller/insumo_controller.dart';
import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsumosPage extends StatefulWidget {
  const InsumosPage({super.key});

  @override
  State<InsumosPage> createState() => _InsumosPageState();
}

class _InsumosPageState extends State<InsumosPage> {
  final _searchEC = TextEditingController();

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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () => Get.toNamed(PagesRoutes.createInsumos),
                child: const Text('Adicionar Insumo')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _searchEC,
              onChanged: (value) {
                // homeController.searchTitle.value = value;
                insumoController.valueBusca.value = value;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      _searchEC.clear();
                      insumoController.valueBusca.value = '';
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
            Expanded(
              child: GetBuilder<InsumoController>(
                builder: (insumoController) {
                  return insumoController.insumosList.isEmpty
                      ? const Center(
                          child: Text('Não há Insumos Cadastrados'),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: insumoController.insumosList.length,
                          itemBuilder: ((context, index) {
                            final insumoIndex =
                                insumoController.insumosList[index];
                            return insumoController.valueBusca.value == ''
                                ? InsumoTile(
                                    insumo: insumoIndex,
                                    onPress: () => insumoController.remove(
                                        insumoController.insumosList[index]),
                                  )
                                : InsumoTile(
                                    insumo: insumoIndex,
                                    onPress: () => insumoController.remove(
                                        insumoController
                                            .insumosListBusca[index]),
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
