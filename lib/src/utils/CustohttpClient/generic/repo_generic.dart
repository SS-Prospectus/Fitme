import 'dart:convert';
import 'package:fitme/src/utils/models/fatpercentagemodel.dart';
import 'package:fitme/src/utils/models/bmimodel.dart';
import 'package:fitme/src/utils/models/idealweightmodel.dart';
import 'package:http/http.dart' as http;

class Repogeneric{

  final String baseurlBmi = 'https://fitness-calculator.p.rapidapi.com/bmi';
  final String baseurlbodyfat = 'https://fitness-calculator.p.rapidapi.com/bodyfat';
  final String baseurlIdealweight = 'https://fitness-calculator.p.rapidapi.com/idealweight';

  final Map<String,String> header = {
    'X-RapidAPI-Key': '7482dff3eemshc3bfe79c2954757p15492bjsnf3fd48620e8d',
    'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'
  };

  Future<Bmi> getBmi(double height, double weight) async {
    final Uri uri = Uri.parse('$baseurlBmi?height=$height&weight=$weight');

    final response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      // Decode the JSON response into a Bmi object
      final jsonData = json.decode(response.body);
      final bmi = Bmi.fromJson(jsonData);

      return bmi;
    } else {
      throw Exception('Failed to load BMI data');
    }
  }

  Future<FatPercentage> getFatPercentage(double height, double weight, double neck, double waist, double hip, String gender,double age) async {
    final Uri uri = Uri.parse('$baseurlbodyfat?height=$height&weight=$weight&neck=$neck&waist=$waist&hip=$hip&age=$age&gender=$gender');

    final response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final fatPercentage = FatPercentage.fromJson(jsonData);
      return fatPercentage;
    } else {
      throw Exception('Failed to load fat percentage data');
    }
  }

  Future<IdealWeight> getIdealWeight(String gender, double height) async {
    final Uri uri = Uri.parse('$baseurlIdealweight?height=$height&gender=$gender');

    final response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final idealweight = IdealWeight.fromJson(jsonData);
      return idealweight;
    } else {
      throw Exception('Failed to load fat percentage data');
    }
  }

}
