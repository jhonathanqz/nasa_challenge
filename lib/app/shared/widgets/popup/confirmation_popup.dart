import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';
import '../footer/footer_flow.dart';
import 'request/confirmation_popup_request.dart';

class ConfirmationPopUp extends StatelessWidget {
  final ConfirmationPopupRequest request;
  const ConfirmationPopUp({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    // final bool isLarge = request.message.contains('\n') || request.messageBold != null;
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              padding: orientation == Orientation.portrait ? Style.edgeInsets.minAll : Style.edgeInsets.sdAll,
              height: orientation == Orientation.portrait ? (size.height / 2.3) : (size.height / 1.3),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Style.theme.shadow,
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
                color: Style.theme.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              request.icon ?? Icons.info,
                              size: orientation == Orientation.portrait ? Style.size.size48 : Style.size.size75,
                            ),
                          ),
                          Style.spacing.md,
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      request.title,
                                      style: Style.fieldStyle.titleBold.copyWith(
                                        color: Style.theme.darkColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Style.spacing.md,
                                  Center(
                                    child: Container(
                                      padding: Style.edgeInsets.minAll,
                                      child: Text(
                                        request.message,
                                        style: Style.fieldStyle.title16,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  request.messageBold != null
                                      ? Center(
                                          child: Container(
                                            padding: Style.edgeInsets.minAll,
                                            child: Text(
                                              request.messageBold!,
                                              style: Style.fieldStyle.title16Bold.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: Style.edgeInsets.hsd,
                    child: FooterFlow(
                      isRemoveIcons: true,
                      labelBack: request.cancelText,
                      labelNext: request.confirmText,
                      onBack: () {
                        if (request.ontapBack != null) {
                          request.ontapBack!();
                          return;
                        }
                        Modular.to.pop();
                      },
                      onNext: request.ontap,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: request.disableCloseButton
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () => Modular.to.pop(),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.theme.redColor,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            size: orientation == Orientation.portrait ? Style.size.size25 : Style.size.size45,
                            color: Style.theme.white,
                          ),
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
