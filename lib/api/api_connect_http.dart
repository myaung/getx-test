import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiConnectHttp {
  static var client = http.Client();

  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<http.Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await client.get(
        _requestUrl(
          _baseUrl,
          path,
          queryParameters: queryParameters,
        ),
        headers: _headers(headers));
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await client.post(
      _requestUrl(
        _baseUrl,
        url,
        queryParameters: queryParameters,
      ),
      headers: _headers(headers),
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await client.put(
      _requestUrl(
        _baseUrl,
        url,
        queryParameters: queryParameters,
      ),
      headers: _headers(headers),
      body: body,
      encoding: encoding,
    );
  }

  Future<http.Response> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await client.delete(
      _requestUrl(
        _baseUrl,
        url,
        queryParameters: queryParameters,
      ),
      headers: _headers(headers),
      body: body,
      encoding: encoding,
    );
  }

  Map<String, String> _headers(Map<String, String>? headers) {
    Map<String, String> _headers = {
      'Authentication': 'bear token',
    };
    if (headers != null) {
      _headers.addAll(headers);
    }
    return _headers;
  }

  Uri _requestUrl(String authority, String unencodedPath,
      {Map<String, dynamic>? queryParameters}) {
    if (authority.startsWith('https://')) {
      return Uri.https(authority.replaceAll(new RegExp('https://'), ''),
          unencodedPath, queryParameters);
    } else if (authority.startsWith('http://')) {
      return Uri.http(authority.replaceAll(new RegExp('http://'), ''),
          unencodedPath, queryParameters);
    }

    throw Exception('Unaccessible Url : ${authority}');
  }
}
