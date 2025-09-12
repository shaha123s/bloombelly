import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AnalyzeLabReportCall {
  static Future<ApiCallResponse> call({
    double? calories,
    double? proteinG,
    double? fatG,
    double? carbG,
    double? sugarG,
    double? fiberG,
    double? sodiumMg,
    double? ironMg,
    double? folateUg,
    double? calciumMg,
    double? caffeineMg,
    double? alcoholG,
    String? foodname = '',
  }) async {
    calories ??= null!;
    proteinG ??= null!;
    fatG ??= null!;
    carbG ??= null!;
    sugarG ??= null!;
    fiberG ??= null!;
    sodiumMg ??= null!;
    ironMg ??= null!;
    folateUg ??= null!;
    calciumMg ??= null!;
    caffeineMg ??= null!;
    alcoholG ??= null!;

    final ffApiRequestBody = '''
{
  "food_name": "${escapeStringForJson(foodname)}",
  "calories":[${calories}] ,
  "protein_g":[${proteinG}] ,
  "fat_g":[${fatG}],
  "carb_g":[${carbG}] ,
  "sugar_g":[${sugarG}] ,
  "fiber_g":[${fiberG}] ,
  "sodium_mg":[${sodiumMg}] ,
  "iron_mg":[${ironMg}],
  "folate_ug":[${folateUg}],
  "calcium_mg":[${calciumMg}] ,
  "caffeine_mg":[${caffeineMg}] ,
  "alcohol_g": [${alcoholG}]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzeLabReport',
      apiUrl: 'https://hare-immortal-loudly.ngrok-free.app/foods/analyze',
      callType: ApiCallType.POST,
      headers: {
        'Key': 'Content-Type',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category_info.description''',
      ));
  static String? cat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.safety_category''',
      ));
  static String? note(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.safety_notes''',
      ));
  static int? score(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.safety_score''',
      ));
}

class GetBabyAdviceCall {
  static Future<ApiCallResponse> call({
    String? question = 'baby',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${escapeStringForJson(question)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBabyAdvice',
      apiUrl: 'https://basilisk-central-visually.ngrok-free.app/advice',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
