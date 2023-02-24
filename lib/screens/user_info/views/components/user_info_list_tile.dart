import 'package:flutter/material.dart';

import '../../../../constants.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    Key? key,
    required this.leadingText,
    required this.trailingText,
  }) : super(key: key);

  final String leadingText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(leadingText),
          trailing: Text(
            trailingText,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(height: defaultPadding / 2),
      ],
    );
  }
}
