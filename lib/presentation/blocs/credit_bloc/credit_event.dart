part of 'credit_bloc.dart';

@immutable
sealed class CreditEvent {}

class GetCreditDataEvent extends CreditEvent {}

class SendCreditDataEvent extends CreditEvent {
  final SendCalcDataModel data;
  SendCreditDataEvent({required this.data});
}
