




import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'mini_courses_model.dart';


class EventDataSource extends CalendarDataSource{
  EventDataSource(List<coursesList> appointments){
    this.appointments = appointments;
  }
}