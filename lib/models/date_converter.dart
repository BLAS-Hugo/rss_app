import 'package:intl/intl.dart';

class DateConverter {

  final currentDate = DateTime.now();

  String date(String date) {
    String start = "Il y a ";
    String form = "EEE, dd MMM yyyy HH:mm:ss Z";
    var format = DateFormat(form);
    DateTime dateTime = format.parse(date);
    if(dateTime == null) {
      return "Date inconnue";
    } else {
      var difference = new DateTime.now().difference(dateTime);
      var days = difference.inDays;
      var hours = difference.inHours;
      var minutes = difference.inMinutes;

      if(days > 1) {
        return "$start $days jours";
      } else if (days == 1) {
        return "$start 1 jour";
      } else if (hours > 1) {
        return "$start $hours heures";
      } else if (hours == 1) {
        return "$start 1 heure";
      } else if (hours < 1) {
        return "$start $minutes minutes";
      } else if (minutes == 1) {
        return "$start 1 minute";
      } else {
        return "A l'instant";
      }
    }
  }

}