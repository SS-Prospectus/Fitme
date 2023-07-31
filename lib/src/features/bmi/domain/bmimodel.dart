import 'package:flutter/foundation.dart';
import 'package:fitme/src/utils/generic/model_factory.dart';

class BmiModelFactory extends ModelFactory<Bmi>{
  @override
  Bmi fromMap(Map<String, dynamic> map) {
    return Bmi.fromJson(map);
  }

}

class Bmi {

  const Bmi({
    required this.statusCode,
    required this.requestResult,
    required this.data,
  });

  final int statusCode;
  final String requestResult;
  final Data data;

  factory Bmi.fromJson(Map<String,dynamic> json) => Bmi(
      statusCode: json['status_code'] as int,
      requestResult: json['request_result'].toString(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>)
  );

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'request_result': requestResult,
    'data': data.toJson()
  };

  Bmi clone() => Bmi(
      statusCode: statusCode,
      requestResult: requestResult,
      data: data.clone()
  );


  Bmi copyWith({
    int? statusCode,
    String? requestResult,
    Data? data
  }) => Bmi(
    statusCode: statusCode ?? this.statusCode,
    requestResult: requestResult ?? this.requestResult,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Bmi && statusCode == other.statusCode && requestResult == other.requestResult && data == other.data;

  @override
  int get hashCode => statusCode.hashCode ^ requestResult.hashCode ^ data.hashCode;
}

@immutable
class Data {

  const Data({
    required this.bmi,
    required this.health,
    required this.healthyBmiRange,
  });

  final double bmi;
  final String health;
  final String healthyBmiRange;

  factory Data.fromJson(Map<String,dynamic> json) => Data(
      bmi: (json['bmi'] as num).toDouble(),
      health: json['health'].toString(),
      healthyBmiRange: json['healthy_bmi_range'].toString()
  );

  Map<String, dynamic> toJson() => {
    'bmi': bmi,
    'health': health,
    'healthy_bmi_range': healthyBmiRange
  };

  Data clone() => Data(
      bmi: bmi,
      health: health,
      healthyBmiRange: healthyBmiRange
  );


  Data copyWith({
    double? bmi,
    String? health,
    String? healthyBmiRange
  }) => Data(
    bmi: bmi ?? this.bmi,
    health: health ?? this.health,
    healthyBmiRange: healthyBmiRange ?? this.healthyBmiRange,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Data && bmi == other.bmi && health == other.health && healthyBmiRange == other.healthyBmiRange;

  @override
  int get hashCode => bmi.hashCode ^ health.hashCode ^ healthyBmiRange.hashCode;
}