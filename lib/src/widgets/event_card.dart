import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_page/src/models/event.dart';

class EventCard extends StatelessWidget {
  final List<Event> events;

  const EventCard({
    Key key,
    this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('MMM d, y');
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: events[0].status == EventStatus.completed ? .5 : 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            dateFormatter.format(events[0].dateTime),
                            style:
                            Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (events[0].status == EventStatus.completed)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.white54,
                              child: Text(
                                'Completed',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 16),
                  _buildEventDetails(context, events[0], false)
                ],
              ),
            ),
          ),
          if (events.length > 1)
            DetailsEventStepper(
              events: events.getRange(1, events.length).toList(),
              builder: _buildEventDetails,
            ),
        ],
      ),
    );
  }

  Widget _buildEventDetails(BuildContext context, Event event,
      [bool showCompletedLabel = true]) {
    final timeFormatter = DateFormat('H:mm');
    return Opacity(
      opacity: event.status == EventStatus.completed ? .5 : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  timeFormatter.format(event.dateTime),
                  style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (showCompletedLabel && event.status == EventStatus.completed)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.white54,
                    child: Text(
                      'Completed',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            event.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 8),
          Text(
            event.locationTitle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          _buildStatus(context, event),
        ],
      ),
    );
  }

  Widget _buildStatus(BuildContext context, Event event) {
    if (event.status == EventStatus.accepted ||
        event.status == EventStatus.completed) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 1,
          color: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  event.status == EventStatus.pending
                      ? 'Your Studio is Still Reviewing This Proposal'
                      : 'Would You Like Accept It?',
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 16),
              if (event.status == EventStatus.none)
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    'Accept',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              if (event.status == EventStatus.none) SizedBox(width: 8),
              if (event.status == EventStatus.none)
                RaisedButton(
                  onPressed: () {},
                  color: Colors.red,
                  child: Text(
                    'Remove',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              if (event.status == EventStatus.pending)
                RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: Text(
                    'Pending',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

typedef Widget EventDetailsBuilder(BuildContext context, Event event);

class DetailsEventStepper extends StatelessWidget {
  final List<Event> events;
  final EventDetailsBuilder builder;

  const DetailsEventStepper({
    Key key,
    this.events,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            bottom: 0,
            left: 9,
            child: Container(
              width: 1,
              color: Colors.grey[400],
            ),
          ),
          Column(
            children: events.map((e) => _buildStep(context, e)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(BuildContext context, Event event) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: event.status == EventStatus.completed ? .8 : 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFAD52C6),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: Color(0xFF8E40A3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: builder(context, event),
            ),
          ),
        ],
      ),
    );
  }
}