import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountListTile extends StatefulWidget {
  final String title;
  final Function onPress;
  final IconData? icon;
  const AccountListTile(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.icon})
      : super(key: key);

  @override
  State<AccountListTile> createState() => _AccountListTileState();
}

class _AccountListTileState extends State<AccountListTile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: ListTile(
          onTap: () {
            widget.onPress();
          },
          leading: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.appPrimary),
            child: Icon(
              widget.icon,
              size: 15,
            ),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.darkblack),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: const FaIcon(FontAwesomeIcons.chevronRight,
                size: 18, color: AppColors.darkblack),
          )),
    );
  }
}
