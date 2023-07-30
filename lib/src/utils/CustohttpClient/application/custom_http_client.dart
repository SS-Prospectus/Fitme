import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart';
import 'package:fitme/src/utils/CustohttpClient/application/custom_exception.dart';
import 'package:fitme/src/utils/logger.dart';
import 'package:fitme/src/features/fatpercentage/domain/fatpercentagemodel.dart';
import 'package:fitme/src/features/bmi/domain/bmimodel.dart';
import 'package:fitme/src/features/idealweight/domain/idealweightmodel.dart';
import 'package:http/http.dart' as http;

part 'custom_http_client.g.dart';

class CustomHttpClient {
  final String baseurl = 'https://fitness-calculator.p.rapidapi.com/';
  final http.Client _client;
  final Ref ref;

  CustomHttpClient(this.ref) : _client = http.Client();

  void _printRequest(String fullPath, String method,
      Map<String, String> headers, dynamic body) {
    debugLog(DebugTags.httpRequest,
        "\nMethod: [$method],\nURL: [$fullPath],\nHEADERS: [$headers],\nBODY: $body\nEND");
  }

  void _printRepsonse(String fullPath, String method,
      Map<String, String> headers, dynamic body, Response response) {
    debugLog(DebugTags.httpClientResponse,
        "\nMETHOD: [$method],\nURL: [$fullPath],\nHEADERS: [$headers],\nSTATUS: [${response.statusCode}]\nBODY:[${response.body}]\nEND");
  }

  Map<String, String> _commonHeaders() {
    return {
      'X-RapidAPI-Key': '7482dff3eemshc3bfe79c2954757p15492bjsnf3fd48620e8d',
      'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'
    };
  }

  Future<List> getList(String relativePath,
      {Map<String, String>? headers, String? keyForList}) async {
    //TODO: finalise the exception handling procedure
    final String fullPath = baseurl+ relativePath;
    final uri = Uri.parse(fullPath);

    final allHeaders = _commonHeaders()..addAll(headers ?? {});

    _printRequest(fullPath, "GET", allHeaders, null);

    final response = await _client.get(uri, headers: allHeaders);

    _printRepsonse(fullPath, "GET", allHeaders, null, response);

    if (response.statusCode / 100 == 4) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      print('hello');
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }
    if (keyForList == null) {
      return jsonDecode(response.body);
    }
    return jsonDecode(response.body)[keyForList];
  }

  Future<Map<String, dynamic>> get(String relativePath,
      {Map<String, String>? headers}) async {
    final String fullPath = baseurl + relativePath;
    final uri = Uri.parse(fullPath);

    final allHeaders = _commonHeaders()..addAll(headers ?? {});

    _printRequest(fullPath, "GET", allHeaders, null);

    final response = await _client.get(uri, headers: allHeaders);

    _printRepsonse(fullPath, "GET", allHeaders, null, response);

    if (response.statusCode / 100 == 4) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      print('hello');
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>?> post(String relativePath,
      {Map<String, String>? headers, dynamic body}) async {
    final String fullPath = baseurl + relativePath;
    final uri = Uri.parse(fullPath);

    final allHeaders = _commonHeaders()..addAll(headers ?? {});

    _printRequest(fullPath, "POST", allHeaders, body);

    final response = await _client.post(uri, headers: allHeaders, body: body);

    _printRepsonse(fullPath, "POST", allHeaders, body, response);

    if (response.statusCode / 100 == 4) {
      //// userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      // print('hello');
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>?> delete(String relativePath,
      {Map<String, String>? headers, dynamic body}) async {
    final String fullPath = baseurl + relativePath;
    final uri = Uri.parse(fullPath);

    final allHeaders = _commonHeaders()..addAll(headers ?? {});

    _printRequest(fullPath, "POST", allHeaders, body);

    final response =
    await _client.delete(uri, headers: allHeaders, body: body);

    _printRepsonse(fullPath, "POST", allHeaders, body, response);

    if (response.statusCode / 100 == 4) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getMap() async {
    var response = await _client.get(
        Uri.parse('https://su-bitspilani.org/su/miscellaneous/get_markers'));

    if (response.statusCode / 100 == 4) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw CustomException.backStableError(
          jsonDecode(response.body)['message']);
    } else if (response.statusCode / 100 == 5) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.backUnstableError();
    } else if (response.statusCode / 100 != 2) {
      //userLog(response.reasonPhrase!, debugTag: DebugTags.httpStatusNotOK);
      throw const CustomException.unknownServerError();
    }

    return jsonDecode(response.body);
  }
}

@riverpod
CustomHttpClient customHttpClient(CustomHttpClientRef ref) {
  return CustomHttpClient(ref);
}
