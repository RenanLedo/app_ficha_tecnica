class Insumo {
  String? id;
  String title;
  double price;
  String unidadeMedida;
  double? custoUnd;

  Insumo({
    this.id,
    required this.title,
    required this.price,
     this.custoUnd,
    required this.unidadeMedida,
  });
}
