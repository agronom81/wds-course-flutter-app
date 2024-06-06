class HttpServerResponse {
  int code;
  String message;
  dynamic data;
  bool status;

  HttpServerResponse(
      {required this.code,
      required this.message,
      required this.data,
      required this.status});
}
