class DioResult<T> {
  int? statusCode;
  // dynamic status;
  String? message;
  T? data;

  DioResult(
      {required this.statusCode,
      required this.data,
      // required this.status,
      this.message});
  DioResult.fromJson(dynamic response, T recordList) {
    try {
      // status = response.data;
      // message = response.data;
      statusCode = response.statusCode;
      data = recordList;
    } catch (e) {
      print(
          "Exception - dioResult.dart - DioResult.fromJson():" + e.toString());
    }
  }
}
