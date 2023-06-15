import 'package:exprezon_driver/widgets/filled_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/sizes.dart';
import '../../../helpers/navigator.dart';
import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../model/ride.dart';

class IncomingRideScreen extends StatelessWidget {
  const IncomingRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      body: Container(
        width: ExprezonDrSizes.width(context),
        decoration: BoxDecoration(
          color: themeIndex != 1
              ? const Color.fromARGB(255, 7, 0, 0)
              : const Color.fromARGB(255, 252, 249, 249),
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: themeIndex != 1 ? .9 : .9,
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? ExprezonDrImages.map
                  : ExprezonDrImages.map1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExprezonDrStatusBar(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ExprezonDrNavigator.back(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.teal,
                    size: 24,
                  ),
                ),
                ExprezonDrText(
                  'Incoming Rides',
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            for (var i = 0; i < 4; i++) const Spacer(),
            Container(
              height: 70,
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(60, 0, 0, 0)
                  : Colors.grey,
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/users/user.png',
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExprezonDrText(
                          ride.driverName,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        ExprezonDrText(
                          '${ride.carType}\n${ride.dateTime}',
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExprezonDrText(
                        ride.price.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      ExprezonDrText(
                        ride.paidFrom,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 90,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(52, 0, 0, 0)
                    : Colors.grey,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExprezonDrText('Ride Info'),
                        ExprezonDrText('08km')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 3, 145, 112),
                        ),
                        ExprezonDrText(
                          '43 Wanpyak Street, Mangu, PL, 9ja',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.navigation,
                          color: Color.fromARGB(255, 3, 145, 112),
                        ),
                        ExprezonDrText(
                          '43 Wanpyak Street, Mangu, PL, 9ja',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Accept', 'Reject']
                  .map((e) => Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          child: ExprezonDrFilledButton.icon(context,
                              icon: e == 'Accept' ? Icons.check : Icons.clear,
                              onPressed: () {},
                              label: Text(e)),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
