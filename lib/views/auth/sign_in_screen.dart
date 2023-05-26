import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../shared/constants/app_color.dart';
import '../../shared/constants/app_image.dart';
import '../../shared/constants/app_string.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  void _onTapGoogleSignIn(BuildContext context) {
    try{
      final provider = Provider.of<AuthProvider>(context, listen: false);
      provider.signInWithGoogle().then((value) {

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      });
    }catch(e){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.welcomeText.toUpperCase(),
              style: const TextStyle(color: AppColor.primary, fontSize: 26,fontWeight: FontWeight.w600),
            ),
            const Text(
              AppString.continueWithGoogle,
              style: TextStyle(color: AppColor.secondary, fontSize: 18)),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onPressed: () => _onTapGoogleSignIn(context),
              btnText: AppString.signInWithGoogle,
              color: AppColor.appWhite,
              textColor: AppColor.textDark,
              prefixIcon: Image.asset(AppImage.google),
            )
          ],
        ),
      ),
    );
  }
}
