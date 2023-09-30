import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_notification/data/models/notification_model/data_model.dart';
import 'package:send_notification/data/models/notification_model/header_model.dart';
import 'package:send_notification/data/models/notification_model/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationModel> {
  NotificationCubit()
      : super(
          NotificationModel(
            dataModel: DataModel(timestamp: 0, title: '', body: '', iconCode: ''),
            headerModel: HeaderModel(title: '', body: ''),
          ),
        );

  // Method to update the title field in headerModel
  void updateHeaderTitle(String newTitle) {
    final updatedHeaderModel = state.headerModel.copyWith(title: newTitle);
    final updatedModel = state.copyWith(headerModel: updatedHeaderModel);
    emit(updatedModel);
  }

  // Method to update the body field in headerModel
  void updateHeaderBody(String newBody) {
    final updatedHeaderModel = state.headerModel.copyWith(body: newBody);
    final updatedModel = state.copyWith(headerModel: updatedHeaderModel);
    emit(updatedModel);
  }

  // Method to update the title field in dataModel
  void updateDataTitle(String newTitle) {
    final updatedDataModel = state.dataModel.copyWith(title: newTitle);
    final updatedModel = state.copyWith(dataModel: updatedDataModel);
    emit(updatedModel);
  }

  // Method to update the body field in dataModel
  void updateDataBody(String newBody) {
    final updatedDataModel = state.dataModel.copyWith(body: newBody);
    final updatedModel = state.copyWith(dataModel: updatedDataModel);
    emit(updatedModel);
  }

  // Method to update the iconCode field in dataModel
  void updateDataIconCode(String? newIconCode) {
    final updatedDataModel = state.dataModel.copyWith(iconCode: newIconCode);
    final updatedModel = state.copyWith(dataModel: updatedDataModel);
    emit(updatedModel);
  }
}
