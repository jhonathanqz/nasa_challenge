import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/core/domain/service/pop_up_service.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/store/setup_store.dart';
import 'package:nasa_challenge/app/shared/widgets/popup/request/information_popup_request.dart';

class SetupController {
  final SetupStore _store;

  SetupController({
    required SetupStore store,
  }) : _store = store;

  SetupStore get store => _store;

  String? userName;
  void setUserName(String value) => userName = value;

  Future<void> saveNewUser() async {
    if (userName == null || userName!.isEmpty) {
      _showInfo('Por favor, digite seu nome.');
      return;
    }
    final result = await _store.saveUser(userName: userName!);

    if (!result) {
      _showInfo(
        _store.errorMessage ?? 'Erro ao salvar usuário',
        isError: true,
      );
      return;
    }

    _showInfo(
      'Bem vindo(a) $userName.\nAgora vamos começar!',
      title: 'Sucesso!',
      call: () => _shouldContinueToHome(),
    );
  }

  void _shouldContinueToHome() {
    Modular.to.pop();
    Modular.to.navigate('/home/');
  }

  void _showInfo(
    String message, {
    String title = 'Atenção!',
    bool isError = false,
    Function()? call,
  }) {
    PopUpService.showInformationDialog(
      InformationPopupRequest(
        title: title,
        message: message,
        icon: isError ? Icons.error : Icons.check,
        ontap: call,
      ),
    );
  }
}
