import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  static const String path = 'assets/icon';
  static const String favActive = '$path/FavIcon.png';
  static const String favInactive = '$path/InFavIcon.png';

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
