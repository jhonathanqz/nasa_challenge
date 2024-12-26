class AppImages {
  static AppImages? _instance;
  AppImages._();
  static AppImages getInstance() {
    return _instance ?? AppImages._();
  }

  final String logo = 'assets/images/logo.jpeg';
}
