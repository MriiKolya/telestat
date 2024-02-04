import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState.initial());

  void changeLocale() {
    if (state.status == LocalizationStatus.en) {
      emit(state.copyWith(
          locale: const Locale('uk'), status: LocalizationStatus.uk));
    } else {
      emit(state.copyWith(
          locale: const Locale('en'), status: LocalizationStatus.en));
    }
  }
}
