import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Exercise.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/utils/decimal_text_input_formatter.dart';
import 'package:nsuns/utils/decorators.dart';
import 'package:nsuns/utils/round_to_increment.dart';

void completeSet({required Cycle cycle, required Set set}) {
  set.toggleCompleteStatus();
  Boxes.getCycles().put(cycle.uuid, cycle);
}

Widget getSlideAction({
  required Set set,
  required Cycle cycle,
  required Exercise exercise,
  required num setWeight,
}) {
  num repsCompleted = set.reps;
  if (!set.isComplete) {
    return SlidableAction(
      onPressed: (context) {
        if (set.isAmrap) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Reps Completed'),
              content: TextFormField(
                decoration: textFieldDecorator(
                    labelText: "Reps Completed (target: ${set.reps})"),
                keyboardType: TextInputType.number,
                inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                initialValue: set.reps.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of reps completed';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (num.tryParse(value) != null) {
                    repsCompleted = num.parse(value);
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    set.repsCompleted = repsCompleted;
                    Boxes.getCycles().put(cycle.uuid, cycle);
                    // If the new PR is greater than the current PR we need to adjust that too
                    if (caculateNewPR(reps: repsCompleted, weight: setWeight) >
                        exercise.currentPR) {
                      exercise.currentPR =
                          caculateNewPR(reps: repsCompleted, weight: setWeight);
                      Boxes.getExercises().put(exercise.uuid, exercise);
                    }
                    completeSet(cycle: cycle, set: set);
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          completeSet(cycle: cycle, set: set);
        }
      },
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      icon: Icons.check,
      label: 'Complete',
    );
  } else {
    return SlidableAction(
      onPressed: (context) {
        set.toggleCompleteStatus();
        Boxes.getCycles().put(cycle.uuid, cycle);
      },
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      icon: Icons.undo,
      label: 'Undo',
    );
  }
}

caculateNewPR({required num reps, required num weight}) {
  return (100 * weight) / (100 - (2.5 * reps));
}

caculateRepsNeededForNewPR(
    {required num weight, required num reps, required num currentPR}) {
  if (currentPR == 0) {
    return 1;
  }
  return ((-100 * weight) + (100 * currentPR)) / (2.5 * currentPR);
}

class SetTile extends StatelessWidget {
  final Set set;
  final Cycle cycle;
  final Exercise exercise;
  const SetTile({
    super.key,
    required this.set,
    required this.cycle,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    final num setWeight = roundToIncrement(
      increment: Boxes.getSetting(key: 'rounding'),
      numberToRound:
          set.percentage! * exercise.trainingMaxData.last.trainingMax,
    );
    final num repsNeededForPR = caculateRepsNeededForNewPR(
            weight: setWeight, reps: set.reps, currentPR: exercise.currentPR!)
        .ceil();
    final num currentPR = roundToIncrement(
        increment: Boxes.getSetting(key: 'rounding'),
        numberToRound: exercise.currentPR!);
    return Card(
      child: InkWell(
        onTap: () {
          set.toggleCompleteStatus();
        },
        child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: 0.3,
            children: [
              getSlideAction(
                set: set,
                cycle: cycle,
                exercise: exercise,
                setWeight: setWeight,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              Expanded(
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${set.reps}${set.isAmrap ? '+' : ''} reps at $setWeight ${Boxes.getSetting(key: 'units')}"),
                      Text(
                        "${set.percentage! * 100}% of training max",
                        style: const TextStyle(fontSize: 12),
                      ),
                      Builder(builder: (context) {
                        if (set.isAmrap) {
                          return Text(
                            "Complete $repsNeededForPR+ to beat your current PR of $currentPR",
                            style: const TextStyle(fontSize: 10),
                          );
                        }
                        return Container();
                      }),
                    ],
                  ),
                  trailing: Icon(
                    Icons.check,
                    color: set.isComplete ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
