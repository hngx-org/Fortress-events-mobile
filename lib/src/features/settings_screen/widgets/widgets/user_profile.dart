import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../general_widgets/custom_elevated_button.dart';
import '../../../../general_widgets/spacing.dart';
import '../make_a_wish_4_screen.dart';

// userprofile definition for user
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 222,
        child: Column(
          children: [
            const Spacing.bigHeight(),
            Container(
              width: 110,
              height: 110,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: User.profileImage,
                  fit: BoxFit.cover,
                ),
                shape: const OvalBorder(),
              ),
            ),
            const Spacing.bigHeight(),
            Text(
              '@${User.handle}',
              style: const TextStyle(
                color: Color(0xFF1D2838),
                fontSize: 24,
                fontFamily: 'Rebond Grotesque',
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
            const Spacing.mediumHeight(),
            Text(User.email),
            CustomElevatedButton(
              buttonStyle: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                side:
                    MaterialStatePropertyAll(BorderSide(color: Colors.black38)),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              width: 122,
              height: 34,
              text: "Edit Profile",
              margin: const EdgeInsets.all(Dimensions.medium),
            ),
          ],
        ),
      ),
    );
  }
}
