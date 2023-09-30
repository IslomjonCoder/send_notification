import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:send_notification/data/models/notification_model/notification_model.dart';
import 'package:send_notification/data/models/result_model.dart';
import 'package:send_notification/services/api_service.dart';

part 'send_notification_state.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  ApiService apiService;

  SendNotificationCubit(this.apiService) : super(SendNotificationInitial());

  void sendNotification(NotificationModel notification) async {
    emit(SendNotificationLoading());
    final response = await apiService.sendNotification(notification: notification);
    response.isSuccess
        ? emit(SendNotificationSuccess())
        : emit(SendNotificationError(response.errorMessage!));
  }
}
