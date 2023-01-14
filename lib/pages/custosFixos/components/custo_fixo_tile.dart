import 'package:flutter/material.dart';

import 'package:app_ficha_tecnica/models/custos_Fixos.dart';

class CustoFixoTile extends StatelessWidget {
  CustosFixos custoFixo;

   CustoFixoTile({
    Key? key,
    required this.custoFixo,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return ListTile(
        title: Text(custoFixo.title),
        subtitle: Text(custoFixo.valor.toString()),
       );
  }
}
