extension FutureExtension<T> on Future<T> {
  Stream<T> toStream() async* {
    var data = await this;
    yield data;
  }
}
