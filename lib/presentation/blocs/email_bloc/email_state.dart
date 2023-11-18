part of 'email_bloc.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}

final class EmailLoading extends EmailState {}

final class EmailError extends EmailState {
  final String errorText;
  EmailError({required this.errorText});
}

final class EmailSuccess extends EmailState {}
