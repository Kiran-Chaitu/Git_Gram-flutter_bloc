import 'package:git_gram/utils/enums.dart';

class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  const ApiResponse._({required this.status, this.data, this.message});

  const ApiResponse.loading() : this._(status: Status.loading);
  const ApiResponse.success(T data)
      : this._(status: Status.success, data: data);
  const ApiResponse.failure(String? message)
      : this._(status: Status.failure, message: message);

  @override
  String toString() {
    return "Status : $status\nMessage : $message\nData : $data";
  }
}
