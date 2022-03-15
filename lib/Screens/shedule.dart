import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studiosdost/Components/add_eventpage.dart';
import 'package:studiosdost/Components/event.dart';
import 'package:studiosdost/Components/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ShedulePage extends StatefulWidget {
  const ShedulePage({Key? key}) : super(key: key);

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddEvent())),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
        body: SfCalendar(
          onTap: ((calendarTapDetails) {}),
          
          view: CalendarView.month,
          dataSource: EventDataSource(events),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).title;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).backgroundColor;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Event _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Event meetingData;
    if (meeting is Event) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

// class Events {
//   /// Creates a meeting class with required details.
//   Events(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;

//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;

//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;

//   /// Background which is equivalent to color property of [Appointment].
//   Color background;

//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }
