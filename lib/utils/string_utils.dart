import 'package:intl/intl.dart';

String getDisplayDate(DateTime date) {
  return DateFormat(DateFormat.YEAR_MONTH_DAY).format(date);
}
