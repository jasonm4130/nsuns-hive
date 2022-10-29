import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/utils/consts.dart';

void updateUnits({required String units}) {
  Boxes.getExercises().values.forEach((exercise) {
    // Loop through the training max data
    for (var trainingMax in exercise.trainingMaxData) {
      // If this isn't a main exercise we don't want to do anything to it
      if (!exercise.isAssistanceExcercise) {
        // Set a variable to store our training max
        num? newTrainigMax;

        // Check which way we are converting
        if (units == 'kg') {
          newTrainigMax = trainingMax.trainingMax * poundsToKilogramsMultiple;
        } else {
          newTrainigMax = trainingMax.trainingMax * kilogramsToPoundsMultiple;
        }

        // Update the exercise training max
        trainingMax.trainingMax = newTrainigMax;
      }
      // Save the exercise
      exercise.save();
    }
  });
}
