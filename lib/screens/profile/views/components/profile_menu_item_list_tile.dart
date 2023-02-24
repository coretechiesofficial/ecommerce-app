import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/components/list_tile/divider_list_tile.dart';

class ProfileMenuListTile extends StatelessWidget {
  const ProfileMenuListTile({
    Key? key,
    required this.text,
    required this.svgSrc,
    required this.press, this.isShowDivider = true,
  }) : super(key: key);

  final String text, svgSrc;
  final VoidCallback press;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    return DividerListTile(
      minLeadingWidth: 24,
      leading: SvgPicture.asset(
        svgSrc,
        height: 24,
        width: 24,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 14, height: 1),
      ),
      press: press,
      isShowDivider: isShowDivider,
    );
  }
}
