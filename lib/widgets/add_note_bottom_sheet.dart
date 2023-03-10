import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //we use BlocProvider here to make it available for screen when  bottom sheet is open
      //AddNoteCubit when we add note
      //we can use BlocProvider in main but we use it here to save resources
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        //we can use blocListener to avoid UI Rebuild
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotesMethod();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            //AbsorbPointer to freeze the ui
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
