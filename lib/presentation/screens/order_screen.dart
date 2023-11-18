import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hack_app/core/app_consts.dart';
import 'package:mega_hack_app/data/models/bank_info_model.dart';
import 'package:mega_hack_app/data/models/send_email_model.dart';
import 'package:mega_hack_app/presentation/blocs/email_bloc/email_bloc.dart';
import 'package:mega_hack_app/presentation/theme/app_fonts.dart';
import 'package:mega_hack_app/presentation/widgets/custom_alert_dialog.dart';
import 'package:mega_hack_app/presentation/widgets/custom_button.dart';
import 'package:mega_hack_app/presentation/widgets/custom_text_field.dart';
import 'package:mega_hack_app/presentation/widgets/item_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    required this.model,
  });
  final Tariffs model;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isAgree = false;
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Контактное лицо',
              controller: controllerName,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              hintText: 'Номер телефона',
              controller: controllerPhone,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              hintText: 'Email',
              controller: controllerEmail,
            ),
            const SizedBox(
              height: 25,
            ),
            ItemWidget(
              tariffs: widget.model,
              onTap: () {},
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: const Color(0xFFAA2920),
                  fillColor: MaterialStateProperty.all(const Color(0xFFAA2920)),
                  value: isAgree,
                  onChanged: (val) {
                    isAgree = val ?? false;
                    setState(() {});
                  },
                ),
                const Text(
                  'Согласен с условиями политики\nконфиденциальности',
                  style: AppFonts.s14w500,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            BlocListener<EmailBloc, EmailState>(
              listener: (context, state) {
                if (state is EmailSuccess) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => const CustomDialogAlert(),
                  );
                }
                if (state is EmailError) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(state.errorText),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is EmailLoading) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        Image.asset('assets/images/loading.gif'),
                  );
                }
              },
              child: CustomButton(
                onPressed: isAgree
                    ? () {
                        BlocProvider.of<EmailBloc>(context).add(
                          SendEmailEvent(
                            model: SendEmailModel(
                              accessToken: AppConsts.accessToken,
                              serviceId: AppConsts.serviceId,
                              templateId: AppConsts.templateId,
                              userId: AppConsts.userID,
                              templateParams: TemplateParams(
                                bankName: widget.model.bankName,
                                phone: controllerPhone.text,
                                toName: controllerName.text,
                                email: controllerEmail.text,
                                creditAmount: widget.model.creditAmount,
                                monthlyPayment: widget.model.monthlyPayment,
                                creditType: widget.model.creditType,
                                totalRepaymentAmount: widget
                                    .model.totalRepaymentAmount
                                    .toString(),
                              ),
                            ),
                          ),
                        );
                      }
                    : null,
                text: 'Отправить',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
