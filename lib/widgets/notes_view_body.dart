import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_note_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});
//4 Custom AppBar
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}


