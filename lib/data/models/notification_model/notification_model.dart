import 'package:send_notification/data/models/notification_model/data_model.dart';
import 'package:send_notification/data/models/notification_model/header_model.dart';

class NotificationModel {
  DataModel dataModel;
  HeaderModel headerModel;

  NotificationModel({
    required this.dataModel,
    required this.headerModel,
  });

  NotificationModel copyWith({
    DataModel? dataModel,
    HeaderModel? headerModel,
  }) {
    return NotificationModel(
      dataModel: dataModel ?? this.dataModel,
      headerModel: headerModel ?? this.headerModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': dataModel,
      'notification': headerModel,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      dataModel: map['data'] as DataModel,
      headerModel: map['notification'] as HeaderModel,
    );
  }
}
