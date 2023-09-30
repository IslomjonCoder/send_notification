part of 'send_notification_cubit.dart';

@immutable
abstract class SendNotificationState {}

class SendNotificationInitial extends SendNotificationState {}

class SendNotificationLoading extends SendNotificationState {}

class SendNotificationError extends SendNotificationState {
  final String errorMessage;

  SendNotificationError(this.errorMessage);
}

class SendNotificationSuccess extends SendNotificationState {}
