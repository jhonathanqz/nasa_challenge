import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';
import '../button/express_button.dart';
import 'request/information_popup_request.dart';

class InformationPopup extends StatelessWidget {
  final InformationPopupRequest request;
  const InformationPopup({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: Container(
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
                      Expanded(
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
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: Style.edgeInsets.hmd,
                child: Row(
                  children: [
                    Expanded(
                      child: ExpressButton(
                        onTapped: () {
                          if (request.ontap != null) {
                            request.ontap!();
                            return;
                          }
                          Modular.to.pop();
                        },
                        label: request.confirmText ?? 'Ok',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
