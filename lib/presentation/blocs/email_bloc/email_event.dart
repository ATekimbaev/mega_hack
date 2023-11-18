part of 'email_bloc.dart';

@immutable
sealed class EmailEvent {}

class SendEmailEvent extends EmailEvent {
  final SendEmailModel model;
  SendEmailEvent({required this.model});
}
