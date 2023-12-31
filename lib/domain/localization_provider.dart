import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

abstract class LocalizationProvider {
  String get decimalSeparator;
  Future loadLocale();
  double parse(String number);
}

class LocalizationProviderImpl implements LocalizationProvider {
  late NumberFormat? _numberFormat;

  void _ensureLocaleIsInitialized() {
    if (_numberFormat == null) {
      throw StateError('The locale was not initialized');
    }
  }

  @override
  double parse(String number) {
    _ensureLocaleIsInitialized();

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
    _ensureLocaleIsInitialized();

    return _numberFormat!.symbols.DECIMAL_SEP;
  }
}
