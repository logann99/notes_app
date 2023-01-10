import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActiveColor,
    required this.color,
  });

  final bool isActiveColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActiveColor
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentColorIndex = 0;
  List<Color> colors = const [
    Color(0xff072448),
    Color(0xff54d2d2),
    Color(0xffffcb00),
    Color(0xfff8aa4b),
    Color(0xffff6150),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: GestureDetector(
                  onTap: () {
                    currentColorIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).color =
                        colors[index];
                    setState(() {});
                  },
                  child: ColorItem(
                    color: colors[index],
                    isActiveColor: currentColorIndex == index,
                  ),
                ));
          }),
    );
  }
}
