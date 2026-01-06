import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AppIcons{
  static const String path = 'assets/icon';
  static const String favActive = '$path/FavIcon.png';
  static const String favInactive = '$path/InFavIcon.png';
 static const searchIcon = FeatherIcons.search;
 static const filterIcon = FontAwesomeIcons.sliders;
 static const rentIcon = FontAwesomeIcons.buildingUser;
 static const inactiveRentIcon = FontAwesomeIcons.buildingUser;
 static const location = Icons.location_on_outlined;
 static const favIcon = Icons.favorite;
 static const inactiveFavIcon = Icons.favorite_border;
 static const profileIcon = Icons.person;
 static const inactiveProfileIcon = Icons.person_outlined;
 static const bookIcon = Icons.vpn_key;
 static const inactiveBookIcon = Icons.vpn_key_outlined;
 static const homeIcon = Icons.home;
 static const inactiveHomeIcon = Icons.home_outlined;
 static const upload = FeatherIcons.uploadCloud;
 static const star = Icons.star;
 static const signOutIcon = Icons.logout;
 static const aboutUsIcon = Icons.info_outline;
 static const editIcon = Icons.edit;
 static const langIcon = Icons.language;
 static const historyIcon = Icons.history;
 static const lightIcon = Icons.brightness_7;
 static const darkIcon = Icons.brightness_2;
 static const exitIcon = Icons.close;
 static const add = Icons.add;
 static const rightArrow = Icons.chevron_right;
 static const startDate = Icons.calendar_today;
 static const endDate = Icons.calendar_month;
 static const floor = Icons.layers_outlined;
 static const area = Icons.square_foot_rounded;
 static const visible = Icons.visibility;
 static const notVisible = Icons.visibility_off;
 static const creditCard = Icons.credit_card;
 static const delete = Icons.delete_outline;
 static const notificationRound = Icons.notifications_none;
 static const notificationSolid = Icons.notifications;
 static const chat = Icons.chat;
 static const share = Icons.share;
 static const save = Icons.save;
 static const uploadFile = Icons.file_upload;
 static const editCalender = Icons.edit_calendar;
 static const cloudUpload = Icons.cloud_upload;
 static const profilePageArrow = Icons.arrow_forward_ios;
  static const searchIcon = FeatherIcons.search;
  static const filterIcon = FontAwesomeIcons.sliders;
  static const rentIcon = FontAwesomeIcons.buildingUser;
  static const inactiveRentIcon = FontAwesomeIcons.buildingUser;
  static const favIcon = Icons.favorite;
  static const inactiveFavIcon = Icons.favorite_border;
  static const profileIcon = Icons.person;
  static const inactiveProfileIcon = Icons.person_outlined;
  static const bookIcon = Icons.vpn_key;
  static const inactiveBookIcon = Icons.vpn_key_outlined;
  static const homeIcon = Icons.home;
  static const inactiveHomeIcon = Icons.home_outlined;
  static const upload = FeatherIcons.uploadCloud;
  static const signOutIcon = Icons.logout;
  static const aboutUsIcon = Icons.info_outline;
  static const editIcon = Icons.edit;
  static const langIcon = Icons.language;
  static const historyIcon = Icons.history;
  static const lightIcon = Icons.brightness_7;
  static const darkIcon = Icons.brightness_2;
  static const exitIcon = Icons.close;
}

class CustomPngIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color? color;

  const CustomPngIcon({
    super.key,
    required this.iconPath,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        iconPath,
        fit: BoxFit.contain,
        color: color,
        colorBlendMode: color != null ? BlendMode.srcIn : null,
      ),
    );
  }
}
