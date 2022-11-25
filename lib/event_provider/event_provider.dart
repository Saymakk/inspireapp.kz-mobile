import 'package:flutter/cupertino.dart';
import 'package:InspireApp/model/mini_courses_model.dart';

class EventProvider extends ChangeNotifier{
final List<coursesList> _events = [];
List <coursesList> get events => _events;
void addEvent (coursesList event) {
  _events.add(event);
  notifyListeners();
}

}