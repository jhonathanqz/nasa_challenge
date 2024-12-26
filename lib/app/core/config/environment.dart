enum Environment {
  staging,
  production;

  String get name {
    switch (this) {
      case Environment.staging:
        return 'URL_BASE';
      case Environment.production:
        return 'URL_BASE';
    }
  }
}
