import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mega_hack_app/data/models/send_email_model.dart';
import 'package:mega_hack_app/data/repositories/email_repository.dart';
import 'package:meta/meta.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc({required this.repositroy}) : super(EmailInitial()) {
    on<SendEmailEvent>((event, emit) async {
      emit(EmailLoading());
      try {
        await repositroy.sendEmail(model: event.model);
        emit(EmailSuccess());
      } catch (e) {
        if (e is DioException) {
          emit(
            EmailError(errorText: e.response?.data.toString() ?? ''),
          );
        } else {
          emit(
            EmailError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
  final EmailRepositroy repositroy;
}
