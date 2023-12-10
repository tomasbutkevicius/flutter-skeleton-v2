import 'package:skeleton_231210/models/request_status_model.dart';
import 'package:flutter/material.dart';

class StatusUtilities {
  static void handleStatusMessage(BuildContext context, RequestStatus status) {
    if (status.message != null && status.message!.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status.message!),
          ),
        );
      });
      return;
    }
  }
}
