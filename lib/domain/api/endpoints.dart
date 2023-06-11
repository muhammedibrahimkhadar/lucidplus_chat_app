import 'package:lucidplus_chat_app/domain/api/base_url.dart';

import 'auth_token.dart';

enum RequestType { get, post, put, patch, delete }

enum EndPoint { sendMessage }

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.sendMessage:
        return "${TelegramApiBaseURL.BASE_URL}/bot${TelegramBotAuthToken.authToken}/sendMessage";

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.sendMessage:
        requestType = RequestType.post;
        break;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;
    switch (this) {
      case EndPoint.sendMessage:
        shouldAdd = false;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
