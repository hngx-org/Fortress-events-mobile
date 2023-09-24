import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/auth/model/profile_details/create_account.dart';
import 'package:event_app/src/features/auth/model/profile_details/user.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/calendar/pages/dashboard.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/constants/dimensions.dart';
import '../../../general_widgets/custom_image_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class HomepageTwo extends ConsumerStatefulWidget {
  const HomepageTwo({super.key});
  static const routeName = '/homepage-two-screen';

  @override
  ConsumerState<HomepageTwo> createState() => _HomepageTwoState();
}

class _HomepageTwoState extends ConsumerState<HomepageTwo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.medium, vertical: Dimensions.big),
          child: Text(
            'Welcome Onboard',
            style: AppTextStyles.textXlBold,
          ),
        ),
        Container(
          color: const Color(0xFFF2F4F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(Dimensions.medium),
                child: Text(
                  'Sign Up using:',
                  style: AppTextStyles.textSmallRegular,
                ),
              ),
              GestureDetector(
                onTap: _handleSignIn,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: Dimensions.medium),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    // Rounded edges
                    color: Colors.white,
                    // White background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: 'assets/images/google_icon.svg',
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacing.mediumHeight(),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleSignIn() async {
    try {
      final notifier = ref.read(userNotifierProvider.notifier);

      final userData = await _googleSignIn.signIn();

      if (userData != null) {
        final user = CreateAccount(
            photoUrl: userData.photoUrl == null
                ? userData.photoUrl ?? 'https://th.bing.com/th/id/R.cec69a569d2d2224a738afb5ad8a419f?rik=VFoqor%2bvcZqRHA&riu=http%3a%2f%2fronaldmottram.co.nz%2fwp-content%2fuploads%2f2019%2f01%2fdefault-user-icon-8.jpg&ehk=KdwKcNMijBB2LcdEzKdT%2bIvtpFWIKQT2HetK7wCogdA%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1'
                : 'https://th.bing.com/th/id/R.cec69a569d2d2224a738afb5ad8a419f?rik=VFoqor%2bvcZqRHA&riu=http%3a%2f%2fronaldmottram.co.nz%2fwp-content%2fuploads%2f2019%2f01%2fdefault-user-icon-8.jpg&ehk=KdwKcNMijBB2LcdEzKdT%2bIvtpFWIKQT2HetK7wCogdA%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
            email: userData.email,
            displayName: userData.displayName ?? '');
        final userDetails = await notifier.createAcc(user);
        debugLog(userDetails.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ));
      } else {
        Navigator.pop(context);
        log('Could not signup');
      }
    } catch (error) {
      log('Error from google auth => ${error.toString()}');
      print(error);
    }
  }
}
