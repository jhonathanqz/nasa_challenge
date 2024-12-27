import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/core/domain/service/pop_up_service.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/home/presentation/store/home_store.dart';
import 'package:nasa_challenge/app/shared/widgets/popup/request/information_popup_request.dart';

class HomeController {
  final HomeStore _homeStore;

  HomeController({
    required HomeStore homeStore,
  }) : _homeStore = homeStore;

  HomeStore get homeStore => _homeStore;

  DateTime? dateTimeSearch;
  void setDateTimeSearch(DateTime dateTime) {
    dateTimeSearch = dateTime;
  }

  void setHightQuality(bool value) {
    _homeStore.setHightQuality(value);
  }

  void search() {
    if (dateTimeSearch == null) {
      _showInfo('Selecione uma data para pesquisar');
      return;
    }
    _homeStore.search(date: dateTimeSearch!);
  }

  void getApodDay() {
    _homeStore.getApodDay();
  }

  void saveFavorite(ApodEntity apod) {
    if (apod.isFavorite) {
      removeFavorite(apod);
      return;
    }
    _homeStore.saveApodFavorite(apod);
  }

  void removeFavorite(ApodEntity apod) => _homeStore.removeApodFavorite(apod);

  void navigateToDetails(ApodEntity apod) => Modular.to.pushNamed('./details', arguments: apod);

  void wipeError() {
    _homeStore.wipeError();
  }

  Future<void> showDateSelect(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateTimeSearch ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateTimeSearch) {
      dateTimeSearch = picked;
      search();
    }
  }

  void changeIndex(int index) {
    if (index == 0) {
      Modular.to.navigate('./page1');
    }
    if (index == 1) {
      Modular.to.navigate('./page2');
    }
  }

  void _showInfo(String message) {
    PopUpService.showInformationDialog(InformationPopupRequest(title: 'Atenção!', message: message));
  }
}
