import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitme/src/constants/constants.dart';

final heightprovider = StateProvider<int>((ref) => 180);
final weightprovider = StateProvider<int>((ref) => 80);
final ageprovider = StateProvider<int>((ref) => 20);
final neckprovider = StateProvider<int>((ref) => 50);
final waistprovider = StateProvider<int>((ref) => 80);
final hipprovider = StateProvider<int>((ref) => 90);
final genderprovider = StateProvider<Gender?>((ref) => null);


final bmiprovider = StateProvider<double>((ref) => 20);
final bmiRangeProvider = StateProvider<String>((ref) => '18.5-25');
final idelamassprovider = StateProvider<double>((ref) => 70);
final bmiComentProvider = StateProvider<String>((ref) => 'Good');
final fatPercentageProvider = StateProvider<int>((ref) => 20);
final fatlevelProvider = StateProvider<String>((ref) => "Fitness");

