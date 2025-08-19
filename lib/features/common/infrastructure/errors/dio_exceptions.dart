part of 'infra_exceptions.dart';

Failure _getDioException(DioException error) {
  late Failure failure;

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      failure = const Failure('Timeout: The request took too long to complete');
    case DioExceptionType.badCertificate:
      failure = const Failure('Bad Certificate: The server certificate is invalid or untrusted');
    case DioExceptionType.badResponse:
      failure = Failure('Bad Response: ${error.response?.data}');
    case DioExceptionType.cancel:
      failure = const Failure('Request was cancelled');
    case DioExceptionType.connectionError:
      failure = const Failure('Connection Error: Unable to connect to the server');
    case DioExceptionType.unknown:
      {
        switch (error.response!.statusCode) {
          case 400:
            failure = Failure(error.response!.data.toString());
          case 401:
            failure = Failure(error.response!.data.toString());
          case 403:
            failure = Failure(error.response!.data.toString());
          case 404:
            failure = Failure('Not Found: ${error.response!.data}');
          case 409:
            failure = const Failure(
              'Conflict: The request could not be completed due to a conflict with the current state of the target resource.',
            );
          case 408:
            failure = const Failure(
              'Request Timeout: The server timed out waiting for the request.',
            );
          case 500:
            failure = const Failure(
              'Internal Server Error: The server encountered an unexpected condition.',
            );
          case 503:
            failure = const Failure(
              'Service Unavailable: The server is currently unable to handle the request.',
            );
          default:
            final responseCode = error.response?.statusCode;
            failure = Failure('Unexpected Error: ${error.response?.data} (Code: $responseCode)');
        }
      }
  }

  return failure;
}
