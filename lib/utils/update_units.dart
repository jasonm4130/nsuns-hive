import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/utils/consts.dart';

void updateUnits({required String units}) {
  // Get all of the cycles and exercises
  Boxes.getCycles().values.forEach((cycle) {
    // Update the units
    cycle.updateExerciseUnits(unitsChangingTo: units);
    // Save the updated cycle
    cycle.save();
  });
  Boxes.getExercises().values.forEach((exercise) {
    // Set a variable to store our training max
    num? newTrainigMax;

    // Check which way we are converting
    if (units == 'kg') {
      newTrainigMax = exercise.trainingMax * poundsToKilogramsMultiple;
    } else {
      newTrainigMax = exercise.trainingMax * kilogramsToPoundsMultiple;
    }

    // Update the exercise training max
    exercise.updateTrainingMax(trainingMax: newTrainigMax);

    // Save the exercise
    exercise.save();
  });
}
