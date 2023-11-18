part of 'credit_bloc.dart';

@immutable
sealed class CreditState {}

final class CreditInitial extends CreditState {}

final class CreditLoading extends CreditState {}

final class CreditError extends CreditState {
  final String errorText;
  CreditError({required this.errorText});
}

final class CreditDataSuccess extends CreditState {
  final CreditDataModel model;
  CreditDataSuccess({required this.model});
}

final class SendDataSuccess extends CreditState {
  final BankInfoModel model;
  SendDataSuccess({required this.model});
}
