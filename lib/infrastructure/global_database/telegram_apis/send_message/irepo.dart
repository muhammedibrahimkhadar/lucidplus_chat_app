import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../domain/api/dio_client.dart';
import '../../../../domain/api/endPoints.dart';

abstract class ITelegramSendMessageRepo {
  Future<void> sendMessageTo(String chatId, String message);
}

class ITelegramSendMessageRepoImpl implements ITelegramSendMessageRepo {
  final _dio = DioClient(Dio());
  @override
  Future<void> sendMessageTo(String chatId, String message) async {
    try {
      var body = FormData.fromMap({
        'chat_id': chatId,
        'text': message,
      });

      var iresp =
          await _dio.request(endPoint: EndPoint.sendMessage, data: body);
      log(iresp.data.toString());
    } catch (e) {
      print(e);
    }
  }
}
