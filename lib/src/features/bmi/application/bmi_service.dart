import 'package:fitme/src/features/bmi/data/bmi_repo.dart';
import 'package:fitme/src/features/bmi/domain/bmimodel.dart';
import 'package:fitme/src/utils/generic/model_factory.dart';
import 'package:fitme/src/utils/generic/service_generic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bmi_service.g.dart';

class BmiService
    extends ServiceGeneric<Bmi, BmiRepo, ModelFactory<Bmi>>{
  BmiService({required super.ref});

  @override
  ModelFactory<Bmi> createModelFactory() {
    return BmiModelFactory();
  }

  @override
  BmiRepo get repoProvider => ref.read(bmiRepoProvider);

}

@riverpod
BmiService bmiService (BmiServiceRef ref) {
  return BmiService(ref: ref);
}