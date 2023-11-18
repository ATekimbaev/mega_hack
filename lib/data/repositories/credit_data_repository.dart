import 'package:dio/dio.dart';
import 'package:mega_hack_app/data/models/bank_info_model.dart';
import 'package:mega_hack_app/data/models/credit_data_model.dart';
import 'package:mega_hack_app/data/models/send_data_calc_model.dart';

class CreditDataRepositroy {
  CreditDataRepositroy({required this.dio});
  final Dio dio;

  Future<CreditDataModel> getCreditData() async {
    final Response response =
        await dio.get('http://192.168.88.177:8080/api/v1/initialization');

    return CreditDataModel.fromJson(response.data);
  }

  Future<BankInfoModel> getBankInfo({required SendCalcDataModel data}) async {
    final Response response = await dio.post(
      'http://192.168.88.177:8080/api/v1/calculation',
      data: data.toJson(),
    );
    return BankInfoModel.fromJson(
      response.data,
    );
  }
}
