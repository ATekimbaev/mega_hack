import 'package:flutter/material.dart';
import 'package:mega_hack_app/data/models/bank_info_model.dart';
import 'package:mega_hack_app/presentation/theme/app_fonts.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.onTap,
    required this.tariffs,
  });

  final Tariffs tariffs;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF343434),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ежемесячный платеж - ${tariffs.monthlyPayment?.round()}',
                      style: AppFonts.s14w500,
                    ),
                    Text(
                      'Сумма кредита - ${tariffs.creditAmount}',
                      style: AppFonts.s14w500,
                    ),
                    Text(
                      'Общая сумма выплат - ${tariffs.totalRepaymentAmount}',
                      style: AppFonts.s14w500,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      tariffs.logoUrl ?? '',
                      height: 60,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/optima.png',
                        height: 50,
                      ),
                    ),
                    Text(
                      tariffs.bankName ?? '',
                      style: AppFonts.s14w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
