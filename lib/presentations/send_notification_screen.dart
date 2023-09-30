import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_notification/business_logic/cubits/notification_cubit/notification_cubit.dart';
import 'package:send_notification/business_logic/cubits/notification_send_cubit/send_notification_cubit.dart';
import 'package:send_notification/data/models/notification_model/data_model.dart';
import 'package:send_notification/data/models/notification_model/notification_model.dart';
import 'package:send_notification/presentations/dynamic_height_textfield.dart';
import 'package:send_notification/utils/colors/colors.dart';
import 'package:send_notification/utils/constants/constants.dart';
import 'package:send_notification/utils/mixins/validator.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({Key? key}) : super(key: key);

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> with FormValidationMixin {
  final _formKey = GlobalKey<FormState>();

  String? currentIconCode;
  TextEditingController headerTitleController = TextEditingController();
  TextEditingController headerBodyController = TextEditingController();
  TextEditingController dateTitleController = TextEditingController();
  TextEditingController dateBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Notification'),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                headerTitleController.clear();
                headerBodyController.clear();
                dateTitleController.clear();
                dateBodyController.clear();
              },
              child: const Text(
                'Clear',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context
                .read<SendNotificationCubit>()
                .sendNotification(context.read<NotificationCubit>().state);
          }
        },
        child: const Icon(Icons.telegram),
      ),
      body: BlocListener<SendNotificationCubit, SendNotificationState>(
        listener: (context, state) {
          if (state is SendNotificationLoading) {
            showLoadingDialog(context, "Notification sending..");
          } else if (state is SendNotificationError) {
            Navigator.pop(context);
            showErrorDialog(context, state.errorMessage);
          } else if (state is SendNotificationSuccess) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: headerTitleController,
                    validator: validateString,
                    onChanged: (value) {
                      _validate();
                      context.read<NotificationCubit>().updateHeaderTitle(value);
                    },
                    decoration: InputDecoration(
                        label: const Text('Notification Title...'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: headerBodyController,
                    validator: validateString,
                    onChanged: (value) {
                      _validate();
                      context.read<NotificationCubit>().updateHeaderBody(value);
                    },
                    decoration: InputDecoration(
                        label: const Text('Notification Body...'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: dateTitleController,
                    validator: validateString,
                    onChanged: (value) {
                      _validate();
                      context.read<NotificationCubit>().updateDataTitle(value);
                    },
                    decoration: InputDecoration(
                        label: const Text('Title...'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: dateBodyController,
                    validator: validateString,
                    onChanged: (value) {
                      _validate();
                      context.read<NotificationCubit>().updateDataBody(value);
                    },
                    decoration: InputDecoration(
                        label: const Text('Body...'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                    validator: validateDropDown,
                    borderRadius: BorderRadius.circular(16),
                    hint: const Text('Select icon mode'),
                    items: iconMapping
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _validate();
                      context.read<NotificationCubit>().updateDataIconCode(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    _formKey.currentState!.validate();
  }
}

void showLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20.0),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
