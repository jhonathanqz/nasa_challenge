abstract class MaskHelper {
  static String formatPhoneNumber(String phoneNumber) {
    // Remove qualquer caractere que não seja número
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (phoneNumber.isEmpty) {
      return '';
    }

    // Aplica a máscara ao número de telefone com DDD de 2 posições
    if (phoneNumber.length < 3) {
      return phoneNumber;
    }
    if (phoneNumber.length > 2 && phoneNumber.length <= 6) {
      final ddd = phoneNumber.substring(0, 2);
      phoneNumber = '($ddd) ${phoneNumber.substring(2)}';
    } else if (phoneNumber.length > 6 && phoneNumber.length <= 10) {
      final ddd = phoneNumber.substring(0, 2);
      final firstPart = phoneNumber.substring(2, 6);
      final secondPart = phoneNumber.substring(6);
      phoneNumber = '($ddd) $firstPart-$secondPart';
    } else if (phoneNumber.length > 10) {
      final ddd = phoneNumber.substring(0, 2);
      final firstPart = phoneNumber.substring(2, 7);
      final secondPart = phoneNumber.substring(7);
      phoneNumber = '($ddd) $firstPart-$secondPart';
    }

    return phoneNumber;
  }

  static String formatCPF(String cpf) {
    // Remove qualquer caractere que não seja número
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.isEmpty) {
      return '';
    }
    // Aplica a máscara ao CPF
    if (cpf.length < 3) {
      return cpf;
    }
    if (cpf.length == 3) {
      final first = cpf.substring(0, 3);
      cpf = cpf.replaceFirst(first, first);
    } else if (cpf.length > 3 && cpf.length < 6) {
      final first = cpf.substring(0, 3);
      cpf = cpf.replaceFirst(first, '$first.');
    } else if (cpf.length == 6) {
      final first = cpf.substring(0, 3);
      final second = cpf.substring(3, 6);
      cpf = cpf.replaceFirst(second, second);
      cpf = cpf.replaceFirst(first, '$first.');
    } else if (cpf.length >= 6 && cpf.length < 9) {
      final first = cpf.substring(0, 3);
      final second = cpf.substring(3, 6);
      cpf = cpf.replaceFirst(second, '$second.');
      cpf = cpf.replaceFirst(first, '$first.');
    } else if (cpf.length == 9) {
      final first = cpf.substring(0, 3);
      final second = cpf.substring(3, 6);
      final third = cpf.substring(6, 9);
      cpf = cpf.replaceFirst(third, third);
      cpf = cpf.replaceFirst(second, '$second.');
      cpf = cpf.replaceFirst(first, '$first.');
    } else if (cpf.length > 9 && cpf.length < 12) {
      final first = cpf.substring(0, 3);
      final second = cpf.substring(3, 6);
      final third = cpf.substring(6, 9);
      cpf = cpf.replaceFirst(third, '$third-');
      cpf = cpf.replaceFirst(second, '$second.');
      cpf = cpf.replaceFirst(first, '$first.');
    }
    return cpf;
  }
}
