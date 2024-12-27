import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/style/style_theme.dart';
import '../../../shared/widgets/popup/confirmation_popup.dart';
import '../../../shared/widgets/popup/error_popup.dart';
import '../../../shared/widgets/popup/information_popup.dart';
import '../../../shared/widgets/popup/modal/modal_confirmation.dart';
import '../../../shared/widgets/popup/modal/modal_error.dart';
import '../../../shared/widgets/popup/password_popup.dart';
import '../../../shared/widgets/popup/popup_textfield.dart';
import '../../../shared/widgets/popup/request/confirmation_popup_request.dart';
import '../../../shared/widgets/popup/request/error_popup_request.dart';
import '../../../shared/widgets/popup/request/information_popup_request.dart';
import '../../../shared/widgets/popup/request/popup_textfield_request.dart';

class PopUpService {
  static void showConfirmationDialog(ConfirmationPopupRequest request) => Modular.to.push(
        _SlideUPPopUpPageRouter(
          onPop: () {},
          child: ConfirmationPopUp(
            request: request,
          ),
        ),
      );

  static void showInformationDialog(InformationPopupRequest request) => Modular.to.push(
        _FadePopUpPageRouter(
          onPop: () {},
          child: InformationPopup(
            request: request,
          ),
        ),
      );

  static void showPasswordDialog(InformationPopupRequest request) => Modular.to.push(
        _FadePopUpPageRouter(
          onPop: () {},
          child: PasswordPopup(
            request: request,
          ),
        ),
      );

  static void showErrorPopup(ErrorPopupRequest request) => Modular.to.push(
        _DefaultPopUpPageRouter(
          onPop: () {},
          child: ErrorPopup(request: request),
        ),
      );

  static void showTextfieldPopup(PopupTextfieldRequest request) => Modular.to.push(
        _DefaultPopUpPageRouter(
          onPop: () {},
          child: PopupTextfield(
            request: request,
          ),
        ),
      );

  static void showModalConfirmation(ConfirmationPopupRequest viewModel) => Modular.to.push(
        _SlideUPPopUpPageRouter(
          onPop: () => Modular.to.pop(),
          child: ModalConfirmation(
            request: viewModel,
          ),
        ),
      );

  static void showModalError(ErrorPopupRequest viewModel) => Modular.to.push(
        _SlideUPPopUpPageRouter(
          onPop: () => Modular.to.pop(),
          child: ModalError(
            request: viewModel,
          ),
        ),
      );
}

class PopUp extends StatelessWidget {
  final Widget child;
  final VoidCallback pop;

  const PopUp({super.key, required this.child, required this.pop});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: pop,
        child: Container(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}

class _DefaultPopUpPageRouter extends PageRouteBuilder {
  final Widget child;
  final VoidCallback onPop;

  _DefaultPopUpPageRouter({
    required this.child,
    required this.onPop,
  }) : super(
          barrierDismissible: true,
          barrierColor: Style.theme.barrier,
          opaque: false,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => PopUp(pop: onPop, child: child),
        );
}

class _FadePopUpPageRouter extends PageRouteBuilder {
  final Widget child;
  final VoidCallback onPop;

  _FadePopUpPageRouter({
    required this.child,
    required this.onPop,
  }) : super(
          barrierDismissible: true,
          barrierColor: Style.theme.barrier,
          opaque: false,
          transitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return PopUp(
              pop: onPop,
              child: child,
            );
          },
        );
}

class _SlideUPPopUpPageRouter extends PageRouteBuilder {
  final Widget child;
  final VoidCallback onPop;
  final Color? color;

  _SlideUPPopUpPageRouter({
    required this.child,
    required this.onPop,
    this.color,
  }) : super(
          barrierDismissible: true,
          barrierColor: color ?? Style.theme.barrier,
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return PopUp(
              pop: onPop,
              child: child,
            );
          },
        );
}
