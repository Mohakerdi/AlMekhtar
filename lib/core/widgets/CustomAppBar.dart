import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/chat/screens/chat_screen.dart';
import 'package:mabeet/Features/user/notifications/screens/notifications_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const CustomAppBar({super.key, required this.titleText});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: NotificationsScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          icon: Icon(AppIcons.notificationRound,color: AppColors.primary700,),
        ),

        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const ChatScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          icon: const Icon(AppIcons.chat,color: AppColors.primary700,),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
