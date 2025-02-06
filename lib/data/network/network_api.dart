import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:git_gram/data/exceptions/app_exceptions.dart';
import 'package:git_gram/utils/tokens.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'token ${Tokens.gitToken}',
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Network Found!');
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    } catch (e) {
      throw FetchDataException('Unexpected Error: $e');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson;

    try {
      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw FetchDataException('Invalid JSON Response');
    }

    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 401:
        throw UnauthorisedException('Unauthorized: ${response.body}');
      case 403:
        throw BadRequestException('Rate limit exceeded: ${response.body}');
      case 404:
        throw NotFoundException('Not Found: ${response.body}');
      default:
        throw FetchDataException(
            'Error: ${response.statusCode} - ${response.body}');
    }
  }
}
