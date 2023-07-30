import 'package:fitme/src/features/bmi/domain/bmimodel.dart';
import 'package:fitme/src/utils/generic/repo_generic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitme/src/utils/provider/provider.dart';

part 'bmi_repo.g.dart';

class BmiRepo extends RepoGeneric<List<Bmi>?> {
  BmiRepo({required super.ref});

  @override
  String get relativeUrl =>
      'bmi?age=${ref.read(ageprovider).toDouble()}&weight=${ref.read(
          weightprovider).toDouble()}&height=${ref.read(heightprovider)
          .toDouble()}';
}
@riverpod
BmiRepo bmiRepo (BmiRepoRef ref) {
  return BmiRepo(ref: ref);
}

final BmiStreamProvider = StreamProvider.autoDispose((ref) => ref.watch(bmiRepoProvider).dataStream());