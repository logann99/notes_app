import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // bool isLoading = false;
  addNoteMethod(NoteModel note) async {
    // isLoading = true;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      // isLoading = false;
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      // isLoading = false;
      AddNoteFailure(e.toString());
    }
  }
}
