import 'package:app_ficha_tecnica/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceitasPage extends StatelessWidget {
  const ReceitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(PagesRoutes.addReceitas),
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
          leading: TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Voltar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          title: const Text(
            'Receitas',
            style: TextStyle(color: Colors.black),
          )),
      body: Container(),
    );
  }
}
