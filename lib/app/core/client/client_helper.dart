import 'client.dart';
import 'client_http.dart';
import 'i_client.dart';

abstract class ClientHelper {
  static IClient getClientBase() => Client(client: ClientHTTP.setupClient());

  static IClient getClientJWT() => Client(client: ClientHTTP.setupClientJwt());
}
