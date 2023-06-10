import 'package:exprezon_driver/constants/sizes.dart';
import 'package:exprezon_driver/helpers/navigator.dart';
import 'package:exprezon_driver/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

XFile? image;

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController phoneController =
      TextEditingController(text: '8146626426');
  final TextEditingController nameController =
      TextEditingController(text: 'Wisdom Dauda');
  final TextEditingController emailController =
      TextEditingController(text: 'codewithwise@gmail.com');
//FN: Focus Node
  final FocusNode phoneFN = FocusNode();
  final FocusNode nameFN = FocusNode();
  final FocusNode emailFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ExprezonDrStatusBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => ExprezonDrNavigator.back(context),
              color: Colors.teal,
              icon: const Icon(Icons.arrow_back_ios),
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
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExprezonDrText(
                    'My Profile'.tr,
                    fontSize: 24,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  ExprezonDrText(
                    'Your Account Details'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: Image.asset('assets/images/users/user.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(),
                      // ),
                    ),
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding: EdgeInsets.zero,
                    controller: phoneController,
                    focusNode: phoneFN,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      //FN: Focus Node
                      // Move focus to the next field
                      FocusScope.of(context).requestFocus(nameFN);
                    },
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      setState(() {});
                    },
                  ),
                  // SizedBox(height: 10.0),
                  TextField(
                    //FN: Focus Node
                    controller: nameController,
                    focusNode: nameFN,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      // Move focus to the next field
                      FocusScope.of(context).requestFocus(emailFN);
                    },
                    decoration: InputDecoration(
                      labelText: 'name'.tr,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: emailController,
                    focusNode: emailFN,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      // Perform any action you want when the last field is submitted
                    },
                    decoration: InputDecoration(
                      labelText: 'email'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                    width: ExprezonDrSizes.width(context) / 1.2,
                    child: ExprezonDrFilledButton(
                        text: 'Update'.tr, onPressed: () {}),
                  ))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
