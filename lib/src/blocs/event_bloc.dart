import 'package:rxdart/rxdart.dart';
import 'package:test_page/src/data/event_repository.dart';
import 'package:test_page/src/models/event.dart';

class EventBloc {
  final EventRepository _eventRepository;
  final BehaviorSubject<Map<DateTime, List<Event>>> _events = BehaviorSubject();
  Stream<Map<DateTime, List<Event>>> get events => _events.stream;

  EventBloc(this._eventRepository) {
    _events.add(_eventRepository.getGroupedEvents());
  }


  void dispose() {
    _events.close();
  }
}