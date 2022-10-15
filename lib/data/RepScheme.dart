import 'package:hive/hive.dart';
import 'package:nsuns/data/Excercise.dart';
part 'RepScheme.g.dart';

@HiveType(typeId: 3)
class RepScheme {
  @HiveField(0)
  final Excercise excercise;
  @HiveField(2)
  final List sets;

  RepScheme({required this.excercise, required this.sets});
}
