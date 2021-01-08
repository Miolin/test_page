import 'package:collection/collection.dart';
import 'package:test_page/src/models/event.dart';

class EventRepository {
  Map<DateTime, List<Event>> getGroupedEvents() {
    return groupBy<Event, DateTime>([
      Event(
        DateTime(2020, 12, 23, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.completed,
      ),
      Event(
        DateTime(2020, 12, 23, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.accepted,
      ),
      Event(
        DateTime(2020, 12, 24, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.pending,
      ),
      Event(
        DateTime(2020, 12, 24, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.none,
      ),
      Event(
        DateTime(2020, 12, 25, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.completed,
      ),
      Event(
        DateTime(2020, 12, 25, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.completed,
      ),
      Event(
        DateTime(2020, 12, 26, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.accepted,
      ),
      Event(
        DateTime(2020, 12, 26, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.pending,
      ),
      Event(
        DateTime(2020, 12, 26, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.none,
      ),
      Event(
        DateTime(2020, 12, 27, 15),
        'Videoclip',
        'Island beach, Hadera',
        EventStatus.completed,
      ),

    ], (e) => e.onlyDate);
  }
}