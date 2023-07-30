import 'package:fitme/src/features/fatpercentage/domain/fatpercentagemodel.dart';
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

class Idealweight {

  const Idealweight({
    required this.statusCode,
    required this.requestResult,
    required this.data,
  });

  final int statusCode;
  final String requestResult;
  final Data data;

  factory Idealweight.fromJson(Map<String,dynamic> json) => Idealweight(
      statusCode: json['status_code'] as int,
      requestResult: json['request_result'].toString(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>)
  );

  Map<String, dynamic> toJson() => {
    'status_code': statusCode,
    'request_result': requestResult,
    'data': data.toJson()
  };

  Idealweight clone() => Idealweight(
      statusCode: statusCode,
      requestResult: requestResult,
      data: data.clone()
  );


  Idealweight copyWith({
    int? statusCode,
    String? requestResult,
    Data? data
  }) => Idealweight(
    statusCode: statusCode ?? this.statusCode,
    requestResult: requestResult ?? this.requestResult,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Idealweight && statusCode == other.statusCode && requestResult == other.requestResult && data == other.data;

  @override
  int get hashCode => statusCode.hashCode ^ requestResult.hashCode ^ data.hashCode;
}

@immutable
class Data {

  const Data({
    required this.hamwi,
    required this.devine,
    required this.miller,
    required this.robinson,
  });

  final double hamwi;
  final double devine;
  final double miller;
  final double robinson;

  factory Data.fromJson(Map<String,dynamic> json) => Data(
      hamwi: (json['Hamwi'] as num).toDouble(),
      devine: (json['Devine'] as num).toDouble(),
      miller: (json['Miller'] as num).toDouble(),
      robinson: (json['Robinson'] as num).toDouble()
  );

  Map<String, dynamic> toJson() => {
    'Hamwi': hamwi,
    'Devine': devine,
    'Miller': miller,
    'Robinson': robinson
  };

  Data clone() => Data(
      hamwi: hamwi,
      devine: devine,
      miller: miller,
      robinson: robinson
  );


  Data copyWith({
    double? hamwi,
    double? devine,
    double? miller,
    double? robinson
  }) => Data(
    hamwi: hamwi ?? this.hamwi,
    devine: devine ?? this.devine,
    miller: miller ?? this.miller,
    robinson: robinson ?? this.robinson,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
      || other is Data && hamwi == other.hamwi && devine == other.devine && miller == other.miller && robinson == other.robinson;

  @override
  int get hashCode => hamwi.hashCode ^ devine.hashCode ^ miller.hashCode ^ robinson.hashCode;
}