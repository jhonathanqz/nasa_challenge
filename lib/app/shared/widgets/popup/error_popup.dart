import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';
import 'request/error_popup_request.dart';

class ErrorPopup extends StatelessWidget {
  final ErrorPopupRequest request;
  const ErrorPopup({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isHightText = request.message.contains('\n');
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: Style.edgeInsets.sdAll,
          height: isHightText ? size.height / 2 : size.height / 2.6,
          width: size.width * 0.8,
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
                          request.icon ?? Icons.cancel_sharp,
                          size: 45,
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
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: _body(
                                isHightText,
                                Container(
                                  padding: Style.edgeInsets.minAll,
                                  child: Text(
                                    request.message,
                                    style: Style.fieldStyle.title.copyWith(
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                      child: MaterialButton(
                        height: Style.size.size45,
                        onPressed: () {
                          if (request.ontap != null) {
                            request.ontap!();
                            return;
                          }
                          Modular.to.pop();
                        },
                        color: Style.theme.buttonColor,
                        child: Text(
                          request.confirmText ?? 'Ok',
                          style: Style.fieldStyle.titleButton.copyWith(
                            color: Style.theme.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
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

  Widget _body(bool isHight, Widget child) {
    if (isHight) {
      return Padding(
        padding: Style.edgeInsets.tsd,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
      );
    }
    return Center(
      child: child,
    );
  }
}
