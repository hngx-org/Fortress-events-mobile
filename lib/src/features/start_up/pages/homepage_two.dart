import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/first_homescreen_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';
import '../../../general_widgets/custom_homepage_button.dart';
import '../../../general_widgets/custom_image_view.dart';

class HomepageTwo extends StatelessWidget {
  const HomepageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          color: Color(0xFF9699A0),
          child: Stack(
      children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  svgPath: 'assets/images/homepage_logo.svg',
                ),
                SizedBox(height: Dimensions.medium,),
                const Text(
                  'Wetin Dey Sup?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: Dimensions.zero,
            right: Dimensions.zero,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  // Adjust the radius as needed
                  topRight: Radius.circular(20.0), // Adjust the radius as needed
                ),
                color: Colors.white, // Container background color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.medium, vertical: Dimensions.large),
                    child: Text(
                      'Welcome Onboard',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFF2F4F7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(Dimensions.medium),
                          child: Text('Sign Up using:', style: TextStyle(fontSize: 20),),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.medium),
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
                        SizedBox(height: Dimensions.medium,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.medium),
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
                                svgPath: 'assets/images/twitter_icon.svg',
                              ),
                              const SizedBox(width: 5.0),
                              const Text(
                                'Twitter',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimensions.large,),


                ],
              ),
            ),
          ),
      ],
    ),
        ));
  }
}
