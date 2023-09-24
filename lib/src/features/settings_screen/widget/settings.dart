import 'package:event_app/src/core/services/base_constants/failure.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/features/start_up/pages/homepage_one.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/src/features/settings_screen/model/settings._model.dart';

// custom widget used to customize subsettings
class SettingsCustomization extends StatelessWidget {
  final List<Settings> settings;
  final ApiServices? apiServices;

  const SettingsCustomization({
    super.key,
    required this.settings,
    this.apiServices,
  });

  Future<void> _showAlertDialog(context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Feature coming soon"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              )
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        child: Column(
          children: [
            ...settings.map(
              (e) => e.leadingIcon != null
                  ? GestureDetector(
                      onTap: () => _showAlertDialog(context),
                      child: ListTile(
                        horizontalTitleGap: 1,
                        leading: SizedBox(height: 20, child: e.leadingIcon),
                        title: Text(
                          e.settingName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: SizedBox(
                          height: 20,
                          child: e.trailingIcon,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text("Are you sure you want to logout?"),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  try {
                                    final googleAuth = GoogleSignIn();
                                    googleAuth.disconnect();
                                    final res = await apiServices?.logout();
                                    if (res != null) {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              HomeScreenOne.routeName);
                                    }
                                  } on Failure catch (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(error.message),
                                      ),
                                    );
                                  }
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      ),
                      child: ListTile(
                        title: Text(
                          e.settingName,
                          style: TextStyle(color: e.color),
                        ),
                        trailing: SizedBox(
                          height: 20,
                          child: e.trailingIcon,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
