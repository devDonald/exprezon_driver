import 'package:exprezon_driver/constants/sizes.dart';
import 'package:exprezon_driver/features/modules/views/home_screen.dart';
import 'package:exprezon_driver/helpers/navigator.dart';
import 'package:exprezon_driver/widgets/filled_button.dart';
import 'package:exprezon_driver/widgets/statusbar.dart';
import 'package:exprezon_driver/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helpers/setting_bottom_bar.dart';
import '../../widgets/credit_card.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  _AddCreditCardScreenState createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  final FocusNode _cardNumberFocusNode = FocusNode();
  final FocusNode _expiryDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final TextEditingController _cardNumberController =
      TextEditingController(text: '1234 5678 9012 3456');
  final TextEditingController _expiryDateController =
      TextEditingController(text: '12/24');
  final TextEditingController _cvvController =
      TextEditingController(text: '123');
  void moveToHomePage() {
    ExprezonDrNavigator.move(HomeScreen(), context);
  }

  @override
  void dispose() {
    _cardNumberFocusNode.dispose();
    _expiryDateFocusNode.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExprezonDrStatusBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                color: Colors.teal,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              ExprezonDrText(
                'Add Payment Account'.tr,
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                color: Colors.teal,
                onPressed: () => showSettings(context),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: TextEditingController(text: 'Wisdom Dauda'),
                      decoration: InputDecoration(
                        label: Text(
                          'Account Name',
                        ),
                      ),
                    ),
                    TextField(
                      controller: TextEditingController(text: '0128388282'),
                      decoration: InputDecoration(
                        label: Text(
                          'Account Number',
                        ),
                      ),
                    ),
                    TextField(
                      controller: TextEditingController(text: 'Providus Bank'),
                      decoration: InputDecoration(
                        label: Text(
                          'Bank Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonDrFilledButton(
                          text: 'continue'.tr,
                          onPressed: () {
                            moveToHomePage();
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        ExprezonDrText('  or  '),
                        const Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonDrFilledButton(
                          text: 'Use Remita',
                          onPressed: () {
                            moveToHomePage();
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonDrFilledButton(
                          text: 'Use Flutter Wave',
                          onPressed: () {
                            moveToHomePage();
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ExprezonDrFilledButton(
                          text: 'Use PayStack',
                          onPressed: () {
                            moveToHomePage();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
