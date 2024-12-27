import 'package:mobx/mobx.dart';
import 'package:nasa_challenge/app/modules/localstorage/presentation/mobx/db.store.dart';

part 'setup_store.g.dart';

class SetupStore = SetupStoreBase with _$SetupStore;

abstract class SetupStoreBase with Store {
  final DBStore _dbStore;

  SetupStoreBase({
    required DBStore dbStore,
  }) : _dbStore = dbStore;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String? errorMessage;

  @action
  void wipeError() {
    isError = false;
    errorMessage = null;
  }

  @action
  Future<bool> saveUser({
    required String userName,
  }) async {
    isLoading = true;
    try {
      await _dbStore.put('user_key', [userName]);
    } catch (e) {
      isLoading = false;
      isError = true;
      errorMessage = e.toString();
      return false;
    }
    isLoading = false;
    return true;
  }
}
