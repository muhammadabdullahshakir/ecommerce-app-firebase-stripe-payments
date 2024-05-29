import 'package:ecomapp/components/custom_button.dart';
import 'package:ecomapp/components/list_card.dart';
import 'package:ecomapp/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final carts = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ListCard();
            }),
        priceFooter(context),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: CustomButton(
            text: "CHECKOUT",
            onPress: () {},
            loading: false,
          ),
        )
      ],
    ));
  }
}

priceFooter(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 2,
          color: CustomTheme.grey,
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text("Total: ", style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              Text(
                "\$ price",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        )
      ],
    ),
  );
}
