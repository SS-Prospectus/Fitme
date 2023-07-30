import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'package:fitme/models/index.dart';
import 'package:fitme/src/utils/generic/model_factory.dart';

class BmiModelFactory extends ModelFactory<Bodyfat>{
  @override
  Bodyfat fromMap(Map<String, dynamic> map) {
    return Bodyfat.fromJson(map);
  }

}

class Bodyfat {

  const Bodyfat({
    required this.statusCode,
    required this.requestResult,
    required this.data,
  });

  final int statusCode;
  final String requestResult;
  final Data data;

  factory Bodyfat.fromJson(Map<String,dynamic> json) => Bodyfat(
      statusCode: json['status_code'] as int,
      requestResult: json['request_result'].toString(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>)
  );

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'request_result': requestResult,
    'data': data.toJson()
  };

  Bodyfat clone() => Bodyfat(
      statusCode: statusCode,
      requestResult: requestResult,
      data: data.clone()
  );


  Bodyfat copyWith({
    int? statusCode,
    String? requestResult,
    Data? data
  }) => Bodyfat(
    statusCode: statusCode ?? this.statusCode,
    requestResult: requestResult ?? this.requestResult,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Bodyfat && statusCode == other.statusCode && requestResult == other.requestResult && data == other.data;

  @override
  int get hashCode => statusCode.hashCode ^ requestResult.hashCode ^ data.hashCode;
}

@immutable
class Data {

  const Data({
    required this.bodyFatUSNavyMethod,
    required this.bodyFatCategory,
    required this.bodyFatMass,
    required this.leanBodyMass,
    required this.bodyFatBMIMethod,
  });

  final double bodyFatUSNavyMethod;
  final String bodyFatCategory;
  final double bodyFatMass;
  final double leanBodyMass;
  final double bodyFatBMIMethod;

  factory Data.fromJson(Map<String,dynamic> json) => Data(
      bodyFatUSNavyMethod: (json['Body Fat (U.S. Navy Method)'] as num).toDouble(),
      bodyFatCategory: json['Body Fat Category'].toString(),
      bodyFatMass: (json['Body Fat Mass'] as num).toDouble(),
      leanBodyMass: (json['Lean Body Mass'] as num).toDouble(),
      bodyFatBMIMethod: (json['Body Fat (BMI method)'] as num).toDouble()
  );

  Map<String, dynamic> toJson() => {
    'Body Fat (U.S. Navy Method)': bodyFatUSNavyMethod,
    'Body Fat Category': bodyFatCategory,
    'Body Fat Mass': bodyFatMass,
    'Lean Body Mass': leanBodyMass,
    'Body Fat (BMI method)': bodyFatBMIMethod
  };

  Data clone() => Data(
      bodyFatUSNavyMethod: bodyFatUSNavyMethod,
      bodyFatCategory: bodyFatCategory,
      bodyFatMass: bodyFatMass,
      leanBodyMass: leanBodyMass,
      bodyFatBMIMethod: bodyFatBMIMethod
  );


  Data copyWith({
    double? bodyFatUSNavyMethod,
    String? bodyFatCategory,
    double? bodyFatMass,
    double? leanBodyMass,
    double? bodyFatBMIMethod
  }) => Data(
    bodyFatUSNavyMethod: bodyFatUSNavyMethod ?? this.bodyFatUSNavyMethod,
    bodyFatCategory: bodyFatCategory ?? this.bodyFatCategory,
    bodyFatMass: bodyFatMass ?? this.bodyFatMass,
    leanBodyMass: leanBodyMass ?? this.leanBodyMass,
    bodyFatBMIMethod: bodyFatBMIMethod ?? this.bodyFatBMIMethod,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Data && bodyFatUSNavyMethod == other.bodyFatUSNavyMethod && bodyFatCategory == other.bodyFatCategory && bodyFatMass == other.bodyFatMass && leanBodyMass == other.leanBodyMass && bodyFatBMIMethod == other.bodyFatBMIMethod;

  @override
  int get hashCode => bodyFatUSNavyMethod.hashCode ^ bodyFatCategory.hashCode ^ bodyFatMass.hashCode ^ leanBodyMass.hashCode ^ bodyFatBMIMethod.hashCode;
}