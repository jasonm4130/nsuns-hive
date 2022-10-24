import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nsuns/data/Boxes.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Set.dart';
import 'package:nsuns/utils/round_to_increment.dart';

Widget getSlideAction({
  required Set set,
  required Cycle cycle,
}) {
  if (!set.isComplete) {
    return SlidableAction(
      onPressed: (context) {
        set.toggleCompleteStatus();
        Boxes.getCycles().put(cycle.uuid, cycle);
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

class SetTile extends StatelessWidget {
  final Set set;
  final num trainingMax;
  final Cycle cycle;
  const SetTile({
    super.key,
    required this.set,
    required this.trainingMax,
    required this.cycle,
  });

  @override
  Widget build(BuildContext context) {
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
                          "${set.reps}${set.isAmrap ? '+' : ''} reps at ${roundToIncrement(
                        increment: Boxes.getSetting(key: 'rounding'),
                        numberToRound: set.percentage! * trainingMax,
                      )} ${Boxes.getSetting(key: 'units')}"),
                      Text(
                        "${set.percentage! * 100}% of training max",
                        style: const TextStyle(fontSize: 12),
                      ),
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
