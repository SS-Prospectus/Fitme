import 'package:fitme/src/features/bmi/application/bmi_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bmi_controller.g.dart';

@riverpod
class BmiController extends _$BmiController{
  @override
  FutureOr build(){}

  Future<void> getData()async{
    state = const AsyncLoading();
    print("a1234");
    state = await AsyncValue.guard(() => ref.read(bmiServiceProvider).getData());
  }
}