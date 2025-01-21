import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    DateTime parsedDate = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  } catch (e) {
    return "";
  }
}