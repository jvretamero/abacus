import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

abstract class LocalizationProvider {
  String get decimalSeparator;
  Future loadLocale();
  double parse(String number);
}

class LocalizationProviderImpl implements LocalizationProvider {
  late NumberFormat? _numberFormat;

  @override
  double parse(String number) {
    if (_numberFormat == null) {
      throw StateError('The locale was not initialized');
    }

    return _numberFormat!.parse(number).toDouble();
  }

  @override
  Future loadLocale() async {
    await findSystemLocale();

    _numberFormat = NumberFormat.decimalPattern();

    return Future.value();
  }

  @override
  String get decimalSeparator {
    return _numberFormat!.symbols.DECIMAL_SEP;
  }
}
