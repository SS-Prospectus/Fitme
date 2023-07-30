import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitme/src/utils/CustohttpClient/application/custom_exception.dart';
import 'package:fitme/src/utils/CustohttpClient/application/custom_http_client.dart';
import 'package:fitme/src/utils/CustohttpClient/application/http_method.dart';
import 'package:fitme/src/utils/in_memory_store.dart';
import 'package:fitme/src/utils/logger.dart';

abstract class RepoGeneric<T> {
  Ref ref;
  late final CustomHttpClient httpProvider;

  HttpMethod get httpMethod => HttpMethod.get;
  bool get isList => false;
  bool get accessAuthNeeded => false;
  String? get keyForList => null;

  Map<String, String> _queryParams = {};

  String get relativeUrl;

  final data = InMemoryStore<T?>(null);

  @mustCallSuper
  RepoGeneric({
    required this.ref,
  }) {
    httpProvider = ref.read(customHttpClientProvider);
  }

  Future<dynamic> getData() async {
    if (isList) {
      return await getListData();
    } else {
      return await getMapData();
    }
  }

  Future<Map<String, String>> headers() async {
    Map<String, String> allHeaders = {};
    allHeaders.addAll(await extraHeaders());
    debugLog(DebugTags.apiCall, allHeaders.toString());
    return allHeaders;
  }

  Future<Map<String, String>> extraHeaders() async {
    return {};
  }

  // Only used for POST.
  Future<dynamic> postBody() async {
    return null;
  }

  void setAllQueryParams(Map<String, String> params) {
    _queryParams = <String, String>{};
    _queryParams.addAll(params);
  }

  void deleteQueryParams(List<String> params) {
    for (var element in params) {
      _queryParams.remove(element);
    }
  }

  String completeUrl() {
    if (_queryParams.isEmpty) {
      return relativeUrl;
    }
    String base = relativeUrl;
    if (base.endsWith('/')) {
      base = base.substring(0, base.length - 1);
    }
    base += '?';

    _queryParams.forEach((key, value) {
      base += '$key=$value&';
    });
/*
    if (base.endsWith('&')) {
      base = base.substring(0, base.length - 1) + '/';
    }
 */
    return base;
  }

  Future<Map> getMapData() async {
    debugLog("RepoGeneric A", completeUrl());
    if (httpMethod == HttpMethod.get) {
      return httpProvider.get(completeUrl(), headers: await headers());
    } else if (httpMethod == HttpMethod.post) {
      return (await httpProvider.post(
        completeUrl(),
        headers: await headers(),
        body: await postBody(),
      ))!;
    } else {
      throw Exception("$httpMethod METHOD not implemented in getMapData");
    }
  }

  //create
  Future<List> getListData() async {
    debugLog("RepoGeneric B", completeUrl());
    if (httpMethod != HttpMethod.get) {
      throw Exception("$httpMethod METHOD not implemented in getListData");
    }

    final response = await httpProvider.getList(completeUrl(),
        headers: await headers(), keyForList: keyForList);
    return response;
  }

  //read
  Stream<T?> dataStream() => data.stream;
  T? dataValue() => data.value;

  //update
  void setValue(T newData) {
    data.value = newData;
    debugLog('debugTag', 'msg');
  }

  void delete() {
    data.value = null;
  }
}