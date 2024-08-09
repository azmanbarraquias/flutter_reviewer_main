import '../../utils/xprint.dart';

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    xPrint('Exception: $message');
    return 'Exception: $message';
    // return super.toString(); // Instance of HttpException
  }
}
