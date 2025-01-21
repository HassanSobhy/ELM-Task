import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/config/theme/colors_manager.dart';
import 'package:flutter/material.dart';

enum Status {
  All(-1, ColorsManager.white),
  Submitted(0, ColorsManager.statusWarning),
  InProgress(1, ColorsManager.blue),
  Completed(2, ColorsManager.green),
  Rejected(3, ColorsManager.statusDanger),
  ;

  final int value;
  final Color color;

  const Status(this.value, this.color);

  static Status fromValue(int value) {
    return Status.values.firstWhere((status) => status.value == value,
        orElse: () => Status.Submitted);
  }

  //get Color based on Value
  static Color getColor(int value) {
    return Status.fromValue(value).color;
  }
}

extension StatusExtension on Status {
  static Map<Status, String> descriptions = {
    Status.All: S.current.all,
    Status.Submitted: S.current.submitted,
    Status.InProgress: S.current.inProgress,
    Status.Completed: S.current.completed,
    Status.Rejected: S.current.rejected,
  };

  String get description => descriptions[this]!;
}
