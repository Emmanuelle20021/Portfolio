import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageIndexCubit extends Cubit<PageController> {
  PageIndexCubit() : super(PageController(initialPage: 0));

  void setPageIndex(int index) {
    emit(
      PageController(initialPage: index),
    );
  }
}
