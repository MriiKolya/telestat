import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState.initial());

  bool isEnglish = true;

  void changeLocale() {
    try {
      isEnglish = !isEnglish;
      Locale locale = isEnglish ? const Locale('eg') : const Locale('uk');
      emit(
        state.copyWith(locale: locale, status: LocalizationStatus.success),
      );
    } catch (e) {
      emit(state.copyWith(error: e, status: LocalizationStatus.error));
    }
  }
}
