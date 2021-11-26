import 'package:intl/intl.dart';

String weekdaysName() {
  return DateFormat('EEEE').format(DateTime.now());
}
