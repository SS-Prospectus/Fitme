import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_exception.freezed.dart';

@freezed
class CustomException with _$CustomException {
  // back error display

  const factory CustomException.authNeededForAccessError() =
  authNeededForAccessError;

  //4xx server error
  const factory CustomException.backStableError(String status) =
  BackStableError;

  //5xx server error
  const factory CustomException.backUnstableError() = BackUnstableError;

  //unknown server error
  const factory CustomException.unknownServerError() = UnknownServerError;

  //error while parsing models
  const factory CustomException.modelParsingError(String status) =
  ModelParsingError;

  //changing quantity to less than 0
  const factory CustomException.qunatityCantBeZero() = QunatityCantBeZero;

  const factory CustomException.customError(String status) = CustomError;
}

class CustomExceptionData {
  CustomExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'CustomExceptionData(code: $code, message: $message)';
}

extension CustomExceptionDetails on CustomException {
  CustomExceptionData get details {
    return when(
      // back error
      backStableError: (status) => CustomExceptionData(
        'parse-order-failure',
        status,
      ),
      customError: (status) => CustomExceptionData(
        'parse-order-failure',
        status,
      ),
      backUnstableError: () => CustomExceptionData(
        'parse-order-failure',
        'Internal server error',
      ),
      modelParsingError: (status) => CustomExceptionData(
        'parse-order-failure',
        'App error: $status',
      ),
      unknownServerError: () => CustomExceptionData(
        'parse-order-failure',
        'Internal server error',
      ),
      authNeededForAccessError: () => CustomExceptionData(
        'parse-order-failue',
        'Login to access this feature',
      ),
      qunatityCantBeZero: () => CustomExceptionData(
        'parse-order-failue',
        'Quantity can not be less than 0',
      ),
    );
  }
}