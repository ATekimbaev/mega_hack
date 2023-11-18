import 'package:dio/dio.dart';
import 'package:mega_hack_app/data/models/send_email_model.dart';

class EmailRepositroy {
  final Dio dio;
  EmailRepositroy({required this.dio});

  Future<void> sendEmail({required SendEmailModel model}) async {
    await dio.post(
      'https://api.emailjs.com/api/v1.0/email/send',
      data: model.toJson(),
    );
  }
}
