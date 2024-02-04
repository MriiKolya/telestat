part of 'localization_cubit.dart';

enum LocalizationStatus { en, uk }

class LocalizationState {
  final LocalizationStatus status;
  final Locale locale;
  const LocalizationState({
    required this.locale,
    required this.status,
  });

  factory LocalizationState.initial() => const LocalizationState(
        status: LocalizationStatus.en,
        locale: Locale('en'),
      );

  LocalizationState copyWith({
    LocalizationStatus? status,
    Object? error,
    Locale? locale,
  }) =>
      LocalizationState(
          status: status ?? this.status, locale: locale ?? this.locale);
}
