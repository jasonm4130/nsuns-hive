DateTime startOfWeek() {
  DateTime now = DateTime.now();
  int currentDay = now.weekday;
  DateTime firstDayOfWeek = now.subtract(Duration(days: currentDay));
  return firstDayOfWeek;
}
