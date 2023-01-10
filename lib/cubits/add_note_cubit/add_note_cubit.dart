// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xff54d2d2);
  // bool isLoading = false;
  addNoteMethod(NoteModel note) async {
    note.color = color.value;
    // isLoading = true;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      // isLoading = false;

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      // isLoading = false;
      emit(AddNoteFailure(e.toString()));
    }
  }
}
