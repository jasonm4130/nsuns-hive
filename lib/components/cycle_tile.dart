import 'package:flutter/material.dart';
import 'package:nsuns/data/Cycle.dart';
import 'package:nsuns/data/Database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nsuns/pages/cycle_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CycleTile extends StatelessWidget {
  final Cycle cycle;
  final Function() refresh;
  CycleTile({super.key, required this.cycle, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (() => {
              Navigator.pushNamed(
                context,
                CyclePage.routeName,
                arguments: {
                  'cycleUuid': cycle.uuid,
                },
              )
            }),
        child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: 0.2,
            children: [
              SlidableAction(
                onPressed: ((context) =>
                    {NsunsDataBase.removeCycle(cycle), refresh()}),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6)),
                icon: Icons.delete,
                label: 'Delete',
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
                  title: Text(cycle.getStartDateFormatted()),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  radius: 20,
                  lineWidth: 2.5,
                  center: Text(
                    '${(cycle.percentageComplete * 100).round().toString()}%',
                    textScaleFactor: .75,
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
