import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackSpace,
        child: const Center(child: CircularProgressIndicator()));
  }

  Future<bool> _onBackSpace() async {
    return false;
  }
}
