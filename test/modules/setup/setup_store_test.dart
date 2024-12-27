import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_challenge/app/modules/localstorage/presentation/mobx/db.store.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/store/setup_store.dart';

class MockDBStore extends Mock implements DBStore {}

void main() {
  late SetupStore setupStore;
  late MockDBStore mockDBStore;

  setUp(() {
    mockDBStore = MockDBStore();
    setupStore = SetupStore(dbStore: mockDBStore);
  });

  group('SetupStore Tests', () {
    test('Initial values are correct', () {
      expect(setupStore.isLoading, false);
      expect(setupStore.isError, false);
      expect(setupStore.errorMessage, null);
    });

    test('wipeError sets isError and errorMessage to null', () {
      setupStore.isError = true;
      setupStore.errorMessage = 'Some error';

      setupStore.wipeError();

      expect(setupStore.isError, false);
      expect(setupStore.errorMessage, null);
    });

    test('saveUser sets isLoading to true and then false', () async {
      when(setupStore.saveUser(userName: 'test_user')).thenAnswer((_) async => true);

      final result = await setupStore.saveUser(userName: 'test_user');

      expect(result, isA<bool>());
    });

    test('saveUser sets isError and errorMessage on failure', () async {
      when(setupStore.saveUser(userName: 'test_user')).thenThrow(Exception('DB error'));

      final result = await setupStore.saveUser(userName: 'test_user');

      expect(result, false);
      expect(setupStore.isLoading, false);
      expect(setupStore.isError, true);
      expect(setupStore.errorMessage, 'Exception: DB error');
    });

    test('saveUser returns true on success', () async {
      when(setupStore.saveUser(userName: 'test_user')).thenAnswer((_) async => true);

      final result = await setupStore.saveUser(userName: 'test_user');

      expect(result, true);
      expect(setupStore.isLoading, false);
      expect(setupStore.isError, false);
      expect(setupStore.errorMessage, null);
    });
  });
}
