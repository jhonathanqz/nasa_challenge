import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../style/style_theme.dart';
import '../../button/express_button.dart';
import '../../sheet/sheet.dart';
import '../request/confirmation_popup_request.dart';

class ModalConfirmation extends StatefulWidget {
  final ConfirmationPopupRequest request;

  const ModalConfirmation({
    super.key,
    required this.request,
  });

  @override
  State<ModalConfirmation> createState() => _ModalConfirmationState();
}

class _ModalConfirmationState extends State<ModalConfirmation> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          children: [
            Center(
              child: Icon(
                widget.request.icon ?? Icons.info_outlined,
                size: 45,
              ),
            ),
            Style.spacing.sm,
            Text(
              widget.request.title,
              style: Style.fieldStyle.titleBold.copyWith(
                color: Style.theme.darkColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Style.spacing.xl,
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.request.message,
                        style: Style.fieldStyle.title.copyWith(
                          color: Style.theme.primaryTextColor,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: Style.edgeInsets.bmd,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: Style.edgeInsets.rmin,
                      child: ExpressButton(
                        onTapped: () {
                          Modular.to.pop();
                          if (widget.request.ontapBack != null) {
                            widget.request.ontapBack!();
                          }
                        },
                        label: widget.request.cancelText,
                        backgroundColor: Style.theme.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ExpressButton(
                      onTapped: () async {
                        Modular.to.pop();
                        await widget.request.ontap();
                      },
                      label: widget.request.confirmText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}