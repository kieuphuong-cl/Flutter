import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:brainiaccommerce2/core/error/exception.dart';
import 'package:brainiaccommerce2/core/service/client/local_service_client.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;

const _defaultApiWaitingDuration = Duration(seconds: 30);
const _defaultApiGetFileWaitingDuration = Duration(minutes: 5);

class ApiServiceClient {
  static Future<Map<String, String>> _headers({
    bool withToken = true,
  }) async {
    String? token = await LocalServiceClient.get("accessToken");
    if (token != null) {
      print("token from score ${token}");
    }
    return {
      HttpHeaders.acceptHeader: "application/json",
      if (withToken == true) HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json"
    };
  }

  static Future<Map<String, dynamic>> get({
    required String uri,
    bool withToken = true,
    Duration? apiWaitingDuration,
    bool isSecondTime = false,
  }) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _headers(withToken: withToken);

      /// Force close after defined waiting time
      Future.delayed(apiWaitingDuration ?? _defaultApiWaitingDuration)
          .whenComplete(() => client.close());
      http.Response response =
          await client.get(Uri.parse(uri), headers: headers);

      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));
      return result;
    } on Io.SocketException catch (_) {
      throw ServerException();
    } catch (e) {
      if (isSecondTime) {
        rethrow;
      } else {
        return await get(
            uri: uri,
            withToken: withToken,
            apiWaitingDuration: apiWaitingDuration,
            isSecondTime: true);
      }
    }
  }

  static Future<dynamic> getDynamic({
    required String uri,
    bool withToken = true,
    Duration? apiWaitingDuration,
    bool isSecondTime = false,
  }) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _headers(withToken: withToken);

      /// Force close after defined waiting time
      Future.delayed(apiWaitingDuration ?? _defaultApiWaitingDuration)
          .whenComplete(() => client.close());
      http.Response response =
          await client.get(Uri.parse(uri), headers: headers);

      return json.decode(utf8.decode(response.bodyBytes));
    } on Io.SocketException catch (_) {
      throw ServerException();
    } catch (e) {
      if (isSecondTime) {
        rethrow;
      } else {
        return await get(
            uri: uri,
            withToken: withToken,
            apiWaitingDuration: apiWaitingDuration,
            isSecondTime: true);
      }
    }
  }

  static Future<Map<String, dynamic>> put(
      {required String uri,
      bool withToken = true,
      Map<String, dynamic>? params,
      Duration? apiWaitingDuration,
      bool isAuthentication = false,
      bool isSecondTime = false}) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _headers(withToken: withToken);
      Future.delayed(apiWaitingDuration ?? _defaultApiGetFileWaitingDuration)
          .whenComplete(() => client.close());
      var response = await client.put(Uri.parse(uri),
          headers: headers, body: (params != null) ? jsonEncode(params) : null);
      print(
          "code response ${json.decode(utf8.decode(response.bodyBytes)).toString()}");
      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));
      return result;
    } on Io.SocketException catch (_) {
      throw ServerException();
    } catch (e) {
      if (isSecondTime) {
        rethrow;
      } else {
        return await put(
            uri: uri,
            params: params,
            isSecondTime: true,
            isAuthentication: isAuthentication,
            withToken: withToken,
            apiWaitingDuration: apiWaitingDuration);
      }
    }
  }

  static Future<Map<String, dynamic>> post({
    required String uri,
    bool withToken = true,
    Map<String, dynamic>? params,
    Duration? apiWaitingDuration,
    bool isSecondTime = false,
    bool isAuthentication = false,
  }) async {
    try {
      final client = http.Client();
      Map<String, String> headers = await _headers(withToken: withToken);

      Future.delayed(apiWaitingDuration ?? _defaultApiWaitingDuration)
          .whenComplete(() => client.close());

      http.Response response = await client.post(Uri.parse(uri),
          headers: headers, body: (params != null) ? jsonEncode(params) : null);
      Map<String, dynamic> result =
          json.decode(utf8.decode(response.bodyBytes));
      return result;
    } on Io.SocketException catch (_) {
      throw ServerException();
    } catch (e) {
      if (isSecondTime) {
        rethrow;
      } else {
        return await post(
            params: params,
            uri: uri,
            isAuthentication: isAuthentication,
            withToken: withToken,
            apiWaitingDuration: apiWaitingDuration,
            isSecondTime: true);
      }
    }
  }

  static Future<Map<String, dynamic>> postFormData({
    required String uri,
    bool withToken = true,
    Map<String, dynamic>? params,
    Duration? apiWaitingDuration,
    bool isSecondTime = false,
    bool isAuthentication = false,
  }) async {
    try {
      print("url ${uri}");
      var url = Uri.parse(uri);
      var request = http.MultipartRequest('POST', url);
      // Thêm dữ liệu form-data
      params?.forEach((key, value) {
        request.fields[key] = value;
      });
      // Gửi yêu cầu và đợi phản hồi
      var response = await request.send();

      // Đọc nội dung của phản hồi
      var responseBody = await response.stream.bytesToString();
      print('Failed to ${response.statusCode} ');

      // Kiểm tra mã trạng thái của phản hồi
      if (response.statusCode == 200) {
        print(
            'Data posted successfully ${jsonDecode(responseBody)["success"]}');
        return jsonDecode(responseBody) as Map<String, dynamic>;
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
        throw ServerException();
      }
    } catch (e) {
      if (isSecondTime) {
        print(e);
        throw ServerException();
      } else {
        return await post(
            params: params,
            uri: uri,
            isAuthentication: isAuthentication,
            withToken: withToken,
            apiWaitingDuration: apiWaitingDuration,
            isSecondTime: true);
      }
    }
  }
}
