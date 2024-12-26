import 'dart:async';
import 'dart:isolate';

class IsolateService {
  static Future<R> run<R>(FutureOr<R> Function() function) async {
    try {
      final result = await Isolate.run<R>(function);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> exit() async {
    try {
      Isolate.exit();
    } catch (_) {}
  }

  static Future<Isolate> spawn<T>(
    void Function(T) entryPoint,
    T message, {
    bool paused = false,
    bool errorsAreFatal = true,
    SendPort? onExit,
    SendPort? onError,
    String? debugName,
  }) async {
    try {
      return await Isolate.spawn(entryPoint, message);
    } catch (_) {
      rethrow;
    }
  }
}
