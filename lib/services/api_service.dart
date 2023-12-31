import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:send_notification/data/models/notification_model/notification_model.dart';
import 'package:send_notification/data/models/result_model.dart';
import 'package:send_notification/utils/constants/constants.dart';

class ApiService {
  // DIO SETTINGS

  final _dio = Dio();

  Future<Result> sendNotification(
      {required NotificationModel notification, String topic = 'news'}) async {
    try {
      final response = await _dio.post(notificationUrl,
          options: Options(headers: {"Authorization": firebaseApiKey}),
          data: {
            "to": "/topics/$topic",
            "notification": notification.headerModel.toJson(),
            "data": notification.dataModel.toJson()..remove('timestamp')
          });
      if (response.statusCode == 200) {
        return Result.success(null);
      }
      return Result.fail(response.data);
    } on DioError catch (e) {
      return Result.fail(e.response.toString());
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
