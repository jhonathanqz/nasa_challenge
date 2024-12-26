import 'api_model_exception.dart';

class ErrorReader {
  String? getMessage(dynamic message) {
    if (message == null) {
      return null;
    }
    if (message.toString().contains('message:')) {
      final model = ApiModelException.fromMap(message);
      return model.message;
    }
    return message.toString();
  }
}
