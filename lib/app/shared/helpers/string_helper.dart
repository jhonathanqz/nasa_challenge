import 'package:intl/intl.dart';

class StringHelper {
  static String onlyText({required String text}) {
    final regexp = RegExp(r'\d');
    var onlyTextSanitized = text.replaceAll(regexp, '');
    return onlyTextSanitized;
  }

  static String onlyNumberString({required String text}) {
    final regexp = RegExp(r'\D');
    var onlySanitized = text.replaceAll(regexp, '');
    return onlySanitized.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
  }

  static double toDouble({required String value}) {
    var valueSanitized = value.replaceAll('R', '').replaceAll('\$', '').replaceAll(' ', '').replaceAll('.', '').replaceAll(',', '.');

    return double.tryParse(valueSanitized) ?? 0.0;
  }

  static double toDoublePriceView({required String value}) {
    var valueSanitized = value.replaceAll('R', '').replaceAll('\$', '').replaceAll(' ', '').replaceAll(',', '.');

    return double.tryParse(valueSanitized) ?? 0.0;
  }

  static String viewCpfSanitized({required String document}) {
    String documentSanitized = '';
    var documentInitial = document.replaceAll('.', '').replaceAll('-', '').replaceAll(' ', '');

    if (documentInitial.length == 11) {
      var formattedDocument = '${documentInitial.substring(0, 3)}.${documentInitial.substring(3, 6)}.${documentInitial.substring(6, 9)}-${documentInitial.substring(9, 11)}';
      documentSanitized = formattedDocument;
    }
    if (documentInitial.length < 11 || documentInitial.length > 11) {
      documentSanitized = documentInitial;
    }
    return documentSanitized;
  }

  static String viewPhoneSanitized({required String phone}) {
    final regexp = RegExp(r'\D');
    var phoneSanitized = '';
    var phoneInitials = phone.replaceAll(regexp, '').replaceAll('(', '').replaceAll(')', '').replaceAll('-', '').replaceAll(' ', '');

    if (phoneInitials.length == 10) {
      var formattedPhoneNumber = '(${phoneInitials.substring(0, 2)}) ${phoneInitials.substring(2, 6)}-${phoneInitials.substring(6, phoneInitials.length)}';
      phoneSanitized = formattedPhoneNumber;
    }
    if (phoneInitials.length == 11) {
      var formattedPhoneNumber2 = '(${phoneInitials.substring(0, 2)}) ${phoneInitials.substring(2, 7)}-${phoneInitials.substring(7, phoneInitials.length)}';
      phoneSanitized = formattedPhoneNumber2;
    }
    if (phoneInitials.length < 10 || phoneInitials.length > 11) {
      phoneSanitized = phoneInitials;
    }
    return phoneSanitized;
  }

  static String viewPrice(double value) {
    var valueSanitized = value.toStringAsFixed(2);

    if (valueSanitized != '') {
      //valueSanitized = 'R\$ ' + valueSanitized.replaceAll('.', ',');
      valueSanitized = 'R\$ ${NumberFormat("#,##0.00", "pt_BR").format(
        value,
      )}';
    } else if (valueSanitized == '') {
      valueSanitized = 'R\$ 0,00';
    } else if (valueSanitized == '0') {
      valueSanitized = 'R\$ 0,00';
    } else {
      valueSanitized = valueSanitized;
    }

    return valueSanitized;
  }

  static String removeCaractereSpecial(String value) {
    final regex = RegExp(r'\W'); //^0-9a-zA-Z
    final newValue = value.replaceAll('/', '-').replaceAll('\\', '-');
    if (newValue.contains(regex)) {
      return newValue.replaceAll(regex, '');
    }
    return newValue;
  }

  static DateTime toDateTime({required String value}) {
    if (value.contains('/')) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.tryParse(value) ?? DateTime.now();
  }

  static toDateTimePriceView({required String value}) {}

  static String getDatePtBr(dynamic value) {
    if (value == null || value == '' || value == 'null') {
      return '';
    }
    final date = DateTime.tryParse(value.toString());
    final dateString = date != null ? DateFormat('dd/MM/yyyy HH:mm:ss').format(date) : '';
    return dateString;
  }
}
