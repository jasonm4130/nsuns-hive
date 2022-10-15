import 'package:hive/hive.dart';
import 'package:nsuns/data/RepScheme.dart';
part 'Day.g.dart';

@HiveType(typeId: 2)
class Day {
  @HiveField(0)
  final int dayNumber;
  @HiveField(1)
  final List<RepScheme> repSchemes;

  Day({required this.dayNumber, required this.repSchemes});
}
