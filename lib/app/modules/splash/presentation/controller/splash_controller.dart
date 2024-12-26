import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/localstorage/presentation/mobx/db.store.dart';

class SplashController {
  final DBStore _dbStore;

  SplashController({
    required DBStore dbStore,
  }) : _dbStore = dbStore;

  Future<void> dismiss() async {
    final localUser = await _dbStore.get('user_key');

    if (localUser.isEmpty) {
      Modular.to.navigate('/setup/');
      return;
    }

    Modular.to.navigate('/home/');
  }
}
