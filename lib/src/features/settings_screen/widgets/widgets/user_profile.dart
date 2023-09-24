import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/src/general_widgets/custom_elevated_button.dart';
import '/src/general_widgets/spacing.dart';
import '/src/core/constants/dimensions.dart';
import '../make_a_wish_4_screen.dart';

// userprofile definition for user
class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(userNotifierProvider);
    return Center(
      child: SizedBox(
        width: 222,
        child: Column(
          children: [
            const Spacing.bigHeight(),
            CustomImageView(
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              url: state.resp?.avatar ?? "",
              radius: BorderRadius.circular(110),
              border: Border.all(color: AppColors.primary1000, width: 4),
            ),
            const Spacing.bigHeight(),
            Text(
              '@${state.resp?.name ?? ''}',
              style: const TextStyle(
                color: Color(0xFF1D2838),
                fontSize: 24,
                fontFamily: 'Rebond Grotesque',
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
            const Spacing.mediumHeight(),
            Text(state.resp?.email ?? ''),
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
