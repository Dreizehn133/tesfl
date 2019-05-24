// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofitApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient extends ApiClient {
  _ApiClient([Dio dio]) {
    _dio = dio;
    if (_dio == null) {
      _dio = Dio();
    }
    _dio.options.baseUrl = 'https://httpbin.org/';
  }

  Dio _dio;

  Future<Response<String>> getData(dynamic limit) async {
    final queryParameters = <String, dynamic>{'limit': limit};
    final data = <String, dynamic>{};
    return _dio.request<String>('ticker',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: {}),
        data: data);
  }

  Future<Response<String>> ip(String query,
      {Map<String, dynamic> queryies = null, String header = null}) async {
    final queryParameters = <String, dynamic>{'query1': query};
    queryParameters.addAll(queryies ?? {});
    final data = <String, dynamic>{};
    return _dio.request<String>('/get',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: {'Header-One': ' header 1', 'Header-Two': header}),
        data: data);
  }
}
