import 'package:belajar_flutter/common/utils/generics/bloc_status.dart';
import 'package:flutter/material.dart';

extension StatusExtension on Status {
  bool isLoaded() {
    return this == Status.loaded;
  }
}

void handleStatus(BuildContext context, Status status) {
  if (status == Status.serverError) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Server Error"),
      ),
    );
  }
  if (status == Status.networkError) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Not connected"),
      ),
    );
  }
  if (status == Status.loading) {
    const Center(child: CircularProgressIndicator());
  }
}
