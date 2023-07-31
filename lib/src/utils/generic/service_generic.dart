import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitme/src/utils/generic/model_factory.dart';
import 'package:fitme/src/utils/generic/repo_generic.dart';
import 'package:fitme/src/utils/logger.dart';
import 'package:fitme/src/utils/CustohttpClient/application/custom_exception.dart';

abstract class ServiceGeneric<M, R extends RepoGeneric,
F extends ModelFactory<M>> {
  Ref ref;
  F? _factory;
  R get repoProvider;

  F get modelFactory => _factory ?? (_factory = createModelFactory());

  F createModelFactory();

  // TODO: REMOVE THIS. ONLY ADDED TEMP FOR TESTING
  bool get doesNotHaveDataTag => true ;
  bool get listInsideDataTag => false;
  String get keyForData => 'data';

  ServiceGeneric({required this.ref});

  Future<void> getData() async {
    // throw CustomException.backStableError('hfiuewh');
    final repo = repoProvider;
    final response = await repo.getData();
    print('#1');
    print(response.toString());
    dynamic valueToPass;
    if (repo.isList || listInsideDataTag) {
      debugLog(DebugTags.apiResult, "red is $response");
      final List<M> temp = [];
      debugLog("Temp", "A");
      final elements = listInsideDataTag ? response[keyForData] : response;
      debugLog("Temp", "B");
      for (var elment in elements) {
        try {
          debugLog("Temp", "C");
          debugLog(DebugTags.apiResult, elment.toString());
          temp.add(modelFactory.fromMap(elment));
          debugLog("Temp", "D");
        } catch (e) {
          throw CustomException.modelParsingError('Data Parsing Error ${e.toString()}');
        }
      }
      valueToPass = temp;
    } else {     debugLog("Temp", "AA");
    final M temp;
    try {
      if (doesNotHaveDataTag) {
        print('#2');
        print(response.toString());
        temp = modelFactory.fromMap(response);
        print('#3');
        print(temp.toString());
      } else {
        temp = modelFactory.fromMap(response[keyForData]);
      }
    } catch (e) {
      throw CustomException.modelParsingError(e.toString());
    }
    valueToPass = temp;
    }
    debugLog(DebugTags.apiCall, 'call and parsing successful');
    repo.setValue(valueToPass);
    debugLog(DebugTags.apiCall, 'call and parsing successful');
  }
}