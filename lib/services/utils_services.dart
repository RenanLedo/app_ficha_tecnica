import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  String porcentagem(double price) {
    NumberFormat numberFormat =
        NumberFormat.decimalPercentPattern(decimalDigits: 0, locale: 'pt_BR');

    return numberFormat.format(price);
  }
}
