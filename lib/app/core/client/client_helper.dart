import 'client.dart';
import 'client_http.dart';
import 'contract/i_client.dart';

abstract class ClientHelper {
  static IClient getClientBase() => Client(client: ClientHTTP.setupClient());
}
