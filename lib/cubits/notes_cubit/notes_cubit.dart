import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../widgets/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotesMethod() async {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}