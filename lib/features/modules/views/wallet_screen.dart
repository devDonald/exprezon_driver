import 'package:exprezon_driver/features/modules/views/ride_detail.dart';
import 'package:exprezon_driver/features/modules/views/sent_to_bank_screen.dart';
import 'package:exprezon_driver/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/navigator.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../model/ride.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExprezonDrText(
                    'Available Amount'.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  ExprezonDrText(
                    '\$379.25',
                    fontSize: 24,
                    // textAlign: T//extAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExprezonDrFilledButton(
                          text: 'Sent to Bank',
                          onPressed: () {
                            ExprezonDrNavigator.move(
                                const SentToBankScreen(), context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ExprezonDrFilledButton(
                          text: 'Add Amount',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExprezonDrText(
                    '    Recent Transactions',
                    color: Colors.grey,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        for (var i = 1; i < 10; i++)
                          ListTile(
                            leading: Image.asset(
                              'assets/images/users/driver.png',
                              width: 50,
                            ),
                            onTap: () => ExprezonDrNavigator.move(
                                RideDetail(ride: ride), context),
                            title: ExprezonDrText(
                              ride.driverName,
                              fontSize: 13,
                            ),
                            subtitle: ExprezonDrText(ride.carType),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ExprezonDrText(
                                  '- \$${ride.price}',
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                                ExprezonDrText(
                                  'Ride Info  >>',
                                  fontSize: 10,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
