import 'package:exprezon_driver/features/auth/views/email_auth.dart';
// import 'package:exprezon_driver/features/auth/views/phone_auth.dart';
import 'package:exprezon_driver/helpers/navigator.dart';
import 'package:exprezon_driver/widgets/statusbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/text.dart';

class InitialAuthPage extends StatefulWidget {
  const InitialAuthPage({Key? key}) : super(key: key);

  @override
  State<InitialAuthPage> createState() => _InitialAuthPageState();
}

class _InitialAuthPageState extends State<InitialAuthPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(timeStamp.inSeconds);
      showSettings(context);
      print('Build Completed');
    });
    // TODO: implement initState
    super.initState();
  }

  String phoneController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ExprezonDrStatusBar(),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => showSettings(context),
            icon: const Icon(Icons.settings),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExprezonDrText(
                  'Exprezon Driver'.tr,
                  fontSize: 24,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                ExprezonDrFilledButton(
                  text: 'continuewithemail'.tr,
                  onPressed: () {
                    ExprezonDrNavigator.move(const EmailAuthScreen(), context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(),
                    ),
                    ExprezonDrText('or'),
                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ExprezonDrFilledButton(
                  text: 'Login'.tr,
                  onPressed: () {
                    print(phoneController);
                    // ExprezonDrNavigator.move(OTPScreen(phone: phoneController));
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
