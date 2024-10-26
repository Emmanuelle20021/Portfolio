import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/constants.dart';

class SectionsKeysCubit extends Cubit<List<GlobalKey>> {
  SectionsKeysCubit()
      : super(
          List.generate(
            Constants.kSections.length,
            (index) => GlobalKey(),
          ),
        );

  get keys => state;

  GlobalKey getKey(index) => keys[index];
}
