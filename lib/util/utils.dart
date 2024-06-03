import 'package:flutter/material.dart';

import '../Constant.dart';

Future<void> showErrorMessage(BuildContext context,String errorMessage) {
  return showGeneralDialog(
    // Background color
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 1),
      context: context,
      pageBuilder: (context, __, ___) {
        Future.delayed(const Duration(seconds: 3), () {
          if (errorKey.currentContext != null) {
            final navigator = Navigator.of(errorKey.currentContext!);
            if (navigator.canPop()) {
              navigator.pop(); // Close the dialog
            }
          }
        });
        return Dialog(
          key: errorKey,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          alignment: AlignmentDirectional.bottomCenter,
          //this right here
          child:  Wrap(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
              begin: const Offset(0, false ? -1 : 1),
              end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      });
}