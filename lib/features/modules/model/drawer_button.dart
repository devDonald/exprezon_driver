import 'package:exprezon_driver/features/modules/views/profile_screen.dart';
import 'package:exprezon_driver/features/modules/views/rides_screen.dart';
import 'package:flutter/material.dart';

import '../views/contact_us.dart';
import '../views/faq_screen.dart';
import '../views/wallet_screen.dart';

class ExprezonDrDrawerButton {
  String title;
  IconData icon;
  Widget? page;
  ExprezonDrDrawerButton({
    required this.title,
    required this.icon,
    this.page,
  });
}

List<ExprezonDrDrawerButton> exprezonDrawerButtons = [
  ExprezonDrDrawerButton(
    title: 'Home',
    icon: Icons.home,
    // page: () => Get.back(),
  ),
  ExprezonDrDrawerButton(
    title: 'My Profile',
    icon: Icons.person,
    page: const ProfileScreen(),
  ),
  ExprezonDrDrawerButton(
    title: 'My Rides',
    icon: Icons.emoji_transportation,
    page: const MyRidesScreen(),
  ),
  ExprezonDrDrawerButton(
    title: 'Wallet',
    icon: Icons.wallet,
    page: const WalletScreen(),
  ),
  ExprezonDrDrawerButton(
    title: 'Promo Code',
    icon: Icons.local_offer,
  ),
  ExprezonDrDrawerButton(
    title: 'Settings',
    icon: Icons.settings,
  ),
  ExprezonDrDrawerButton(
    title: 'FAQs',
    icon: Icons.help,
    page: const FAQScreen(),
  ),
  ExprezonDrDrawerButton(
    title: 'Contact Us',
    icon: Icons.mail,
    page: const ContactScreen(),
  ),
];
