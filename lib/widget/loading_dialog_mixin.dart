import 'package:flutter/material.dart';

// ViewでDialogを表示するコード
mixin LoadingDialogMixin {
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
  }

  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showCompleteSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('処理が完了しました')),
    );
  }
}