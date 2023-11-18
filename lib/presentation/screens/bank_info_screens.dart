import 'package:flutter/material.dart';
import 'package:mega_hack_app/data/models/bank_info_model.dart';
import 'package:mega_hack_app/presentation/screens/order_screen.dart';
import 'package:mega_hack_app/presentation/widgets/item_widget.dart';

class BankInfoScreens extends StatelessWidget {
  const BankInfoScreens({
    super.key,
    required this.model,
  });
  final BankInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: model.tariffs?.length,
        itemBuilder: (context, index) => ItemWidget(
          tariffs: model.tariffs?[index] ?? Tariffs(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderScreen(
                  model: model.tariffs?[index] ?? Tariffs(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
