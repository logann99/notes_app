import 'package:hive/hive.dart';
part 'note_model.g.dart';
//1- extends
//2- Hive Type
//2-Hive Field
//3- part
//4-write this line in terminal flutter packages pub run build_runner build
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
