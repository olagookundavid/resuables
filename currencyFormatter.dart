import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AppFormatter {
  CurrencyTextInputFormatter formatter({
    int decimal = 0,
    String symbol = "N",
  }) {
    final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      decimalDigits: 0,
      symbol: '\$ ',
    );
    return formatter;
  }

  static String format(
      {int decimal = 0, String symbol = "₦", required String value}) {
    final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      decimalDigits: decimal,
      symbol: symbol,
    );
    return formatter.format(value);
  }
}
