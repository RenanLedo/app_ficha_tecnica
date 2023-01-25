class Despesa {
  String? id;
  String title;
  double price;
  String unidadeMedida;
  double? custoUnd;
  double? custoInReceita;

  Despesa({
    this.id,
    required this.title,
    required this.price,
    this.custoUnd,
    this.custoInReceita,
    required this.unidadeMedida,
  });
}