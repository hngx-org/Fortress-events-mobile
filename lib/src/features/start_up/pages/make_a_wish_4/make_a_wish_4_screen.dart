import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
//import 'package:event_app/src/core/general_widgets/custom_bottom_bar.dart';
import 'package:event_app/src/general_widgets/base_button.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_list_tile.dart';

class MakeAWish4Screen extends StatelessWidget {
  MakeAWish4Screen({super.key});

  Widget _userProfileSubWidget = Center(
    child: SizedBox(
      width: 222,
      child: Column(
        children: <Widget>[
          const Spacing.bigHeight(),
          Container(
            width: 110,
            height: 110,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: User.profileImage,
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          const Spacing.mediumHeight(),
          Text('@${User.handle}',
              style: const TextStyle(
                color: Color(0xFF1D2838),
                fontSize: 24,
                fontFamily: 'Rebond Grotesque',
                fontWeight: FontWeight.w700,
                height: 0.06,
              )),
          const Spacing.mediumHeight(),
          Text(User.email),
          CustomElevatedButton(
            buttonStyle: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFF9BB1A9)),
            ),
            width: 122,
            text: "Edit Profile",
            margin: const EdgeInsets.all(Dimensions.medium),
          ),
        ],
      ),
    ),
  );

  final Widget _settingsWidget = Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        customCard(
          children: [
            CustomListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Appearance'),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
            const Spacing.smallHeight(),
            CustomListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Language & Region'),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ],
        ),
        const Spacing.smallHeight(),
        customCard(
          children: [
            CustomListTile(
              leading: const Icon(Icons.brush),
              title: const Text('Help & Support'),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
            const Spacing.smallHeight(),
            CustomListTile(
              leading: const Icon(Icons.brush),
              title: const Text('About'),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ],
        ),
        const Spacing.smallHeight(),
        customCard(
          children: [
            CustomListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing:
                  const Icon(Icons.exit_to_app_rounded, color: Colors.red),
            ),
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Change this to custom appbar
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      //TODO: implement reusable bottom bar widget
      //bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          color: PrimaryColors().blueGray400,
          child: Column(
            children: [
              _userProfileSubWidget,
              const Spacing.largeHeight(),
              _settingsWidget,
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  static String handle = "Salome", email = 'salome367@gmail.com';
  // static var profileImage = AssetImage(ImageConstant.imgEllipse1);
  static var profileImage = const AssetImage('assets/images/img_ellipse1.png');
}

Widget customCard({required List<Widget> children}) {
  return Container(
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Column(
      children: children,
    ),
  );
}
