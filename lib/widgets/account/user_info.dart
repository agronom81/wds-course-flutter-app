import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../models/user.dart';
import '../custom_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: user.avatar != ''
                ? CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                      user.avatar,
                    ),
                  )
                : CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: CustomText(
                      fontSize: 34,
                      text: getFirstLetter(
                        user.user_display_name,
                      ),
                    ),
                  ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: user.user_display_name,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: user.user_email,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
