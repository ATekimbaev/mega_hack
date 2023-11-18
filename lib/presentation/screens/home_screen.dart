// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hack_app/data/models/send_data_calc_model.dart';
import 'package:mega_hack_app/presentation/blocs/credit_bloc/credit_bloc.dart';
import 'package:mega_hack_app/presentation/screens/bank_info_screens.dart';
import 'package:mega_hack_app/presentation/theme/app_fonts.dart';
import 'package:mega_hack_app/presentation/widgets/custom_button.dart';
import 'package:mega_hack_app/presentation/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<CreditBloc>(context).add(
      GetCreditDataEvent(),
    );
    super.initState();
  }

  final TextEditingController controllerSumm = TextEditingController();
  final TextEditingController controllerDuration = TextEditingController();

  String? selectedValute;

  String? selectedCreditType;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text('Кредитный калькулятор'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<CreditBloc, CreditState>(
                  listener: (context, state) {
                    print(state);
                    if (state is CreditLoading) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            Image.asset('assets/images/loading.gif'),
                      );
                    }
                    if (state is SendDataSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BankInfoScreens(
                            model: state.model,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CreditError) {
                      return Text(
                        state.errorText == '' ? 'Error' : state.errorText,
                        style: AppFonts.s14w500,
                      );
                    }
                    if (state is CreditDataSuccess) {
                      List<String> creditTypes = state.model.creditTypes
                              ?.map((e) => e.typeCred ?? '')
                              .toList() ??
                          [];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          valutaWidget(context, state.model.currencies ?? []),
                          const Spacer(),
                          creditWidget(
                            context,
                            creditTypes,
                          ),
                        ],
                      );
                    }
                    return const CircularProgressIndicator.adaptive();
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    creditSummWidget(context),
                    const Spacer(),
                    creditDurationWidget(context),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () async {
                    BlocProvider.of<CreditBloc>(context).add(
                      SendCreditDataEvent(
                        data: SendCalcDataModel(
                          creditAmount: int.tryParse(controllerSumm.text) ?? 0,
                          creditTerm:
                              int.tryParse(controllerDuration.text) ?? 0,
                          creditType: selectedCreditType,
                        ),
                      ),
                    );
                  },
                  text: 'Расчитать',
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column creditDurationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Срок кредита',
          style: AppFonts.s14w500,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: CustomTextField(
            hintText: '36',
            controller: controllerDuration,
          ),
        ),
      ],
    );
  }

  Column creditSummWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Сумма кредита',
          style: AppFonts.s14w500,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: CustomTextField(
            hintText: '100000',
            controller: controllerSumm,
          ),
        ),
      ],
    );
  }

  Column creditWidget(BuildContext context, List<String> items) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Выберите кредит',
          style: AppFonts.s14w500,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Text(
              'Кредит',
              style: AppFonts.s14w500,
            ),
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppFonts.s14w500.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedCreditType,
            onChanged: (String? value) {
              setState(() {
                selectedCreditType = value;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ],
    );
  }

  Column valutaWidget(BuildContext context, List<String> items) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Выберите валюту',
          style: AppFonts.s14w500,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Text(
              'Валюта',
              style: AppFonts.s14w500,
            ),
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppFonts.s14w500.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedValute,
            onChanged: (String? value) {
              setState(() {
                selectedValute = value;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
