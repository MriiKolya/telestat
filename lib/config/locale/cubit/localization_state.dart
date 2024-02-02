part of 'localization_cubit.dart';

enum LocalizationStatus { loading, success, error, initial }

class LocalizationState {
  final LocalizationStatus status;
  final Locale locale;
  final Object? error;

  const LocalizationState({
    required this.locale,
    required this.status,
    this.error,
  });

  factory LocalizationState.initial() => const LocalizationState(
        status: LocalizationStatus.initial,
        locale: Locale('en'),
      );

  LocalizationState copyWith({
    LocalizationStatus? status,
    Object? error,
    Locale? locale,
  }) =>
      LocalizationState(
          status: status ?? this.status,
          error: error ?? this.error,
          locale: locale ?? this.locale);
}
