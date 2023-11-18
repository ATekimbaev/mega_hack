import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mega_hack_app/data/models/bank_info_model.dart';
import 'package:mega_hack_app/data/models/credit_data_model.dart';
import 'package:mega_hack_app/data/models/send_data_calc_model.dart';
import 'package:mega_hack_app/data/repositories/credit_data_repository.dart';
import 'package:meta/meta.dart';

part 'credit_event.dart';
part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  CreditBloc({required this.repositroy}) : super(CreditInitial()) {
    on<GetCreditDataEvent>(
      (event, emit) async {
        try {
          final model = await repositroy.getCreditData();
          emit(CreditDataSuccess(model: model));
        } catch (e) {
          if (e is DioException) {
            emit(
              CreditError(
                errorText: e.response?.data.toString() ?? '',
              ),
            );
          } else {
            emit(
              CreditError(
                errorText: e.toString(),
              ),
            );
          }
        }
      },
    );
    on<SendCreditDataEvent>(
      (event, emit) async {
        emit(
          CreditLoading(),
        );
        try {
          final model = await repositroy.getBankInfo(data: event.data);
          emit(
            SendDataSuccess(
              model: model,
            ),
          );
        } catch (e) {
          if (e is DioException) {
            emit(
              CreditError(
                errorText: e.response?.data.toString() ?? '',
              ),
            );
          } else {
            emit(
              CreditError(
                errorText: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
  final CreditDataRepositroy repositroy;
}
