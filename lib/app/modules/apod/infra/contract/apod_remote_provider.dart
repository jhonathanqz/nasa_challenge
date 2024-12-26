abstract class ApodRemoteProvider {
  Future<dynamic> getApodDay();
  Future<dynamic> search({
    DateTime? date,
  });
}
