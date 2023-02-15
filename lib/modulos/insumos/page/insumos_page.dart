import 'package:app_ficha_tecnica/components/custom_text_field.dart';
import 'package:app_ficha_tecnica/components/custon_button.dart';
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
        title: const Text(
          'Insumos',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustonButton(
                onPress: () => Get.toNamed(PagesRoutes.createInsumos),
                label: 'Adicionar Insumo'),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _searchEC,
              label: 'Pesquise aqui...',
              suffixIcon: Icons.search,
              onChanged: (value) => insumoController.setListFiltered(value),
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
                          itemCount: insumoController.insumoListSeach.length,
                          itemBuilder: ((context, index) {
                            // final insumoIndex =
                            //     insumoController.insumosList[index];
                            final insumoIndexFilter =
                                insumoController.insumoListSeach[index];
                            return InsumoTile(
                                insumo: insumoIndexFilter,
                                onPress: () {
                                  insumoController.remove(insumoIndexFilter);
                                });
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
