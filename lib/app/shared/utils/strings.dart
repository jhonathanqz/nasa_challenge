class Strings {
  static StringsExceptions exceptions = StringsExceptions();
}

class StringsExceptions {
  final String userCodeInvalid = 'Código inválido!';
  final String passwordInvalid = 'Senha inválida, por favor verifique.';
  final String unableToSetSettings = 'Houve um erro ao gravar as configurações.';
  final String loginUnauthorized = 'Usuário ou senha inválidos. Tente novamente.';
  final String loginError = 'Houve um erro ao realizar o login.';
  final String loginApiException = 'Tivemos um problema em nosso servidor.\nTente novamente mais tarde.';
  final String genericException = 'Tivemos um problema em nosso servidor.\nTente novamente mais tarde.';
  final String tryAgain = 'Tente novamente.';
  final String connectTimeout = 'Erro de conexão com o servidor.';
  final String apiConnectionError = 'Falha de conexão com o servidor.';
  final String apiException = 'Tivemos um problema em nosso servidor. Tente novamente mais tarde.';
  final String healthCheckNotFound = 'Não conseguimos comunicação com o servidor.\nTente novamente mais tarde.';
  final String settingsNotFound = 'Nenhuma configuração foi definida.';
  final String updateErrorSettings = 'Erro ao atualizar banco de dados.';
  final String deleteErrorSettings = 'Erro ao excluir dados.';
  final String productNotFound = 'Produto não encontrado.';
  final String companyException = 'Não encontramos dados para a empresa selecionada.';
  final String genericError = 'Erro ao retornar dados. Tente novamente.';
  final String jwtExpired = 'Token expirado.';
  final String barcodeReadException = 'Ocorreu um erro ao tentar ler o código de barras.\nTente novamente.';
  final String errorConfigureSitef = 'Erro ao configurar TEF. Entre em contato com o suporte.';
  final String sessionExpired = 'Sessão expirada.';
}
