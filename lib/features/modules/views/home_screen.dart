import 'dart:async';

import 'package:exprezon_driver/features/modules/model/drawer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets.dart';
import '../../../constants/sizes.dart';
import '../../../helpers/navigator.dart';
import '../../../helpers/setting_bottom_bar.dart';
import '../../../widgets/filled_button.dart';
import '../../../widgets/statusbar.dart';
import '../../../widgets/text.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/user_accounts_header.dart';
import 'car_selection_screen.dart';
import 'incoming_ride_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : null,
        width: ExprezonDrSizes.width(context) / 1.2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () => ExprezonDrNavigator.back(context),
                  icon: const Icon(Icons.arrow_back_ios)),
              for (ExprezonDrDrawerButton drawerButton in exprezonDrawerButtons)
                Container(
                  // height: 30,
                  margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: ListTile(
                    leading: Icon(
                      drawerButton.icon,
                      // color: Colors.teal,
                    ),
                    onTap: () {
                      if (drawerButton.title == 'Home') {
                        ExprezonDrNavigator.back(context);
                      } else if (drawerButton.title == 'Settings') {
                        showSettings(context);
                      } else {
                        ExprezonDrNavigator.move(
                            drawerButton.page ??
                                Scaffold(
                                  appBar: AppBar(),
                                ),
                            context);
                      }
                    },
                    tileColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 68, 68, 68)
                        : const Color.fromARGB(66, 63, 63, 63),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: ExprezonDrText(drawerButton.title),
                    // shape: ,
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              const ExprezonDrUserAccountsWidget(),
              Center(child: ExprezonDrText('Exprezon Driver © 2023'))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: ExprezonDrText(isOnline == false ? 'Go Online' : 'Go Offline'),
          onPressed: () {
            if (isOnline == false) {
              Future.delayed(Duration(seconds: 3)).then((value) =>
                  ExprezonDrNavigator.move(IncomingRideScreen(), context));
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      actions: [Center(child: CircularProgressIndicator())],
                      title: Center(
                        child: ExprezonDrText(
                            'Searching for Rides near Your Location'),
                      ),
                    );
                  });
            }
            setState(() {
              isOnline = !isOnline;
            });
          }),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.red,
        child: Column(
          children: [
            ExprezonDrStatusBar(),
            Expanded(
              child: Stack(
                children: [
                  //This will be Replaced with the Map
                  InteractiveViewer(
                    child: Image.asset(
                      ExprezonDrImages.map,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ListTile(
                    title: ExprezonDrText(
                      '12 Rides  | ₦29,600',
                      // onPressed: () {},
                    ),
                    subtitle: ExprezonDrText(
                      'Today',
                      fontWeight: FontWeight.bold,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(ExprezonDrImages.driver),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: ExprezonDrSizes.height(context) / 12,
                      //  color: themeIndex == 1 ? Colors.transparent : Colors.teal,
                      width: ExprezonDrSizes.width(context),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                ),
                              );
                            }),
                            IconButton(
                              onPressed: () {
                                showSettings(context);
                              },
                              icon: const Icon(
                                Icons.settings,
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
