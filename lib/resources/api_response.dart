

class ApiResponse<T> {
  final T? body;
  final String? errorMessage;
  final bool isSuccessful;

  ApiResponse({this.isSuccessful = false, this.body, this.errorMessage});
}