import 'package:flutter/material.dart';

mixin DbExtension {
  bool wasOperationSuccessfull(int count, int id) {
    if (count == 0) {
      debugPrint("Update failed: No user found with ID $id");
    } else {
      debugPrint("Update successful: $count row(s) updated");
    }
    return count > 0;
  }
}
