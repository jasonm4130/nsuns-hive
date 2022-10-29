DateTime startOfWeek({DateTime? date}) {
  // If we didn't get a date use the current one
  date ??= DateTime.now();
  int currentDay = date.weekday;
  DateTime firstDayOfWeek = date.subtract(Duration(days: currentDay));
  return firstDayOfWeek;
}
