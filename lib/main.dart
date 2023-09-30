import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_notification/business_logic/cubits/notification_cubit/notification_cubit.dart';
import 'package:send_notification/business_logic/cubits/notification_send_cubit/send_notification_cubit.dart';
import 'package:send_notification/presentations/send_notification_screen.dart';
import 'package:send_notification/services/api_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NotificationCubit()),
          BlocProvider(create: (context) => SendNotificationCubit(ApiService())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SendNotificationScreen(),
        ));
  }
}
