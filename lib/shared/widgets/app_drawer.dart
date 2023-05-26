import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../provider/todo_provider.dart';
import '../../views/auth/sign_in_screen.dart';
import '../constants/app_color.dart';
import '../constants/app_string.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  void _onTapLogOut(BuildContext context) {
    try {
      final provider = Provider.of<AuthProvider>(context, listen: false);
      final todoProvider = Provider.of<TODOProvider>(context, listen: false);
      todoProvider.disposeAllValues();
      provider.signOut().then((value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
          (route) => false,
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.primary,
            ),
            child: Text(
              AppString.appName,
              style: TextStyle(
                  color: AppColor.appWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text(
              AppString.logout,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.secondary),
            ),
            onTap: () => _onTapLogOut(context),
            trailing: const Icon(Icons.logout, color: AppColor.secondary),
          ),
        ],
      ),
    );
  }
}
