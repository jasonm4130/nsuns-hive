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
        cycle.save();
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
        cycle.save();
      },
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      icon: Icons.delete,
      label: 'Delete',
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
    print(set.isComplete);
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
                flex: 5,
                child: ListTile(
                  title: Text("${set.reps} x ${roundToIncrement(
                    increment: Boxes.getSetting(key: 'rounding'),
                    numberToRound: set.percentage! * trainingMax,
                  )}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
