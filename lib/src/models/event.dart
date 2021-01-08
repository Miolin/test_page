class Event {
  final DateTime dateTime;
  final String title;
  final String locationTitle;
  final EventStatus status;

  Event(this.dateTime, this.title, this.locationTitle, this.status);

  DateTime get onlyDate =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);
}

enum EventStatus { completed, accepted, pending, none }
