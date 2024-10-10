import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NotificationCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? title = '',
    String? body = '',
    String? image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "$token",
  "notification": {
    "title": "$title",
    "body": "$body",
    "image": "$image"
  },
  "priority": "high",
  "importance": "max",
  "collapse_key": "my_key",
  "time_to_live": 3600,
  "android_channel_id": "random_channel_id",
  "color": "#rrggbb"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Notification',
      apiUrl: 'https://fcm.googleapis.com/fcm/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'key=AAAAg8f7bX0:APA91bHU3YDIv0ZTxHHkhhv244j-d0c03A-mjv3FzNZ8zU-jrT2LHtlhT3Or3SoPBFlZK54m3sqt_RDc2gMQSh0igSS4STlyoGe4RVtfhjhs7VH6FxVZRbR-oKLUOrveBInuQDNfIEMv',
        'Content-Type': 'application/json',
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

class CountryCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'country',
      apiUrl: 'http://ip-api.com/json/?fields=61439',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.country''',
      ));
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.countryCode''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
}

class CountryFalgCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Country Falg',
      apiUrl: 'https://restcountries.com/v3.1/alpha/$code',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'Code': code,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? flg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].flags.png''',
      ));
}

class SupabaseUsernameCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? age = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Supabase Username',
      apiUrl:
          'https://intubuvndadrxutcpxnl.supabase.co/rest/v1/User?or=(Username.ilike.*$searchString*)&select=* &Deleted=eq.false&select=* &Age=eq.$age&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Profile_Pic''',
      ));
  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Username''',
      ));
  static String? looking(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Looking''',
      ));
}

class SupabaseUserProfileCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Supabase User Profile',
      apiUrl:
          'https://aoftiofofvsqctgootft.supabase.co/rest/v1/User?or=(Profile_Pic.ilike.*$searchString*)&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvZnRpb2ZvZnZzcWN0Z29vdGZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc3MjE5MjAsImV4cCI6MjA0MzI5NzkyMH0.Cl-5-eIUMWlxGSs5wU0Ilgbxm-YXmCcaApeO8q_v3DE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvZnRpb2ZvZnZzcWN0Z29vdGZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc3MjE5MjAsImV4cCI6MjA0MzI5NzkyMH0.Cl-5-eIUMWlxGSs5wU0Ilgbxm-YXmCcaApeO8q_v3DE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Profile_Pic''',
      ));
  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Username''',
      ));
  static String? looking(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Looking''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].User_Id''',
      ));
}

class SupabaseUserCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Supabase User',
      apiUrl:
          'https://intubuvndadrxutcpxnl.supabase.co/rest/v1/User?or=( id.ilike.*$searchString*)&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Profile_Pic''',
      ));
  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Username''',
      ));
  static String? looking(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Looking''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].User_Id''',
      ));
}

class SupabaseAppVesrionCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Supabase App Vesrion',
      apiUrl:
          'https://intubuvndadrxutcpxnl.supabase.co/rest/v1/App_Version?or=( idd.ilike.*$searchString*)&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImludHVidXZuZGFkcnh1dGNweG5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4ODAyNjcsImV4cCI6MjAxMDQ1NjI2N30.bFQEMlnOY848Q8ukX3ROsPX2wMIpDRSMOtDuCjITh3U',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? version(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Version''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].UpdateUrl''',
      ));
}

class ImageUploadCall {
  static Future<ApiCallResponse> call({
    String? image = '',
    String? key = '',
    int? expiration,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Image Upload',
      apiUrl: 'https://api.imgbb.com/1/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
        'key': key,
        'expiration': expiration,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.image.url''',
      ));
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
  if (item is DocumentReference) {
    return item.path;
  }
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
