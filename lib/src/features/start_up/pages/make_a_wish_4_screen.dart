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
    child: const Column(
      children: <Widget>[
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.brush),
                title: Text('Appearance'),
                contentPadding: EdgeInsets.all(16),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
              ListTile(
                leading: Icon(Icons.brush),
                title: Text('Language & Region'),
                contentPadding: EdgeInsets.all(16),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ],
          ),
        ),
        Spacing.smallHeight(),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.brush),
                title: Text('Help & Support'),
                contentPadding: EdgeInsets.all(16),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
              ListTile(
                leading: Icon(Icons.brush),
                title: Text('About'),
                contentPadding: EdgeInsets.all(16),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ],
          ),
        ),
        Spacing.smallHeight(),
        Card(
          child: ListTile(
            visualDensity:
                VisualDensity(vertical: VisualDensity.minimumDensity),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            trailing: Icon(Icons.exit_to_app_rounded, color: Colors.red),
            contentPadding: EdgeInsets.all(16),
          ),
        )
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
        child: Column(
          children: [
            _userProfileSubWidget,
            const Spacing.mediumHeight(),
            _settingsWidget,
          ],
        ),
      ),
    );
  }
}

class User {
  static String handle = "Salome", email = 'salome367@gmail.com';
  static var profileImage = const AssetImage('assets/images/img_ellipse1.png');
  //const NetworkImage("https://via.placeholder.com/110x110");
}

class CustomListView extends StatelessWidget {
  Widget? leading, title, trailing;
  SizedBox emptySizedBox = const SizedBox(
    width: 0,
  );

  CustomListView({this.title, this.leading, this.trailing, super.key});

  @override
  Widget build(BuildContext context) {
    title ??= emptySizedBox;
    leading ??= emptySizedBox;
    trailing ??= emptySizedBox;

    return Row(
      children: [
        leading!,
        if (leading != emptySizedBox)
          const SizedBox(
            width: 8,
          ),
        Expanded(
          child: SizedBox(
            child: title,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        trailing!,
      ],
    );
  }
}

Widget customCard() {
  return Container(
    width: 122,
    height: 34,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Column(
      children: [],
    ),
  );
}
