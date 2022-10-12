import 'package:hive_flutter/adapters.dart';
import 'package:nsuns/data/Excercise.dart';
import 'package:nsuns/utils/start_of_week.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:uuid/uuid.dart';

class NsunsDataBase {
  static List cycles = [];
  static List excercises = [];

  static final _nsunsBox = Hive.box('nsuns_database');
  static var uuid = const Uuid();

  // Get the cycles from our hive box
  static void loadCycles() {
    if (_nsunsBox.get('cycles') != null) {
      cycles = _nsunsBox.get('cycles');
    }
  }

  // Add a cycle method
  static void addCycle() {
    final DateTime startDate = startOfWeek();
    // Add our cycle to the db
    cycles.add(Cycle(startDate: startDate, uuid: uuid.v4()));

    // Updated the DB
    updateDataBase();
  }

  // Add a cycle method
  static void removeCycle(Cycle cycle) {
    // Remove the cycle from the list
    cycles.remove(cycle);

    // Updated the DB
    updateDataBase();
  }

  static void loadExcercises() {
    if (_nsunsBox.get('excercises') != null) {
      excercises = _nsunsBox.get('excercises');
    }
  }

  static void addExcercise({required Excercise excercise}) {
    // Check that we aren't trying to add the same excercise
    if (excercises
        .where((currentExcercise) => currentExcercise.name == excercise.name)
        .isNotEmpty) {
      // The excercise already exists just update it
      excercises[excercises.indexWhere(
              (currentExcercise) => currentExcercise.name == excercise.name)] =
          excercise;
    } else {
      // Add our excercise
      excercises.add(excercise);
    }

    // Update the DB
    updateDataBase();
  }

  // Put the data in the hive box
  static void updateDataBase() {
    _nsunsBox.put('cycles', cycles);
    _nsunsBox.put('excercises', excercises);
  }
}
