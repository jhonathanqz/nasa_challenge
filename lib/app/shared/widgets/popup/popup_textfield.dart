import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';
import '../button/express_button.dart';
import '../textfield/primary_textfield.dart';
import 'request/popup_textfield_request.dart';

class PopupTextfield extends StatefulWidget {
  final PopupTextfieldRequest request;
  const PopupTextfield({
    super.key,
    required this.request,
  });

  @override
  State<PopupTextfield> createState() => _PopupTextfieldState();
}

class _PopupTextfieldState extends State<PopupTextfield> {
  final _editController = TextEditingController();

  @override
  void dispose() {
    _editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: Style.edgeInsets.sdAll,
          height: size.height / 1.5,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          widget.request.icon ?? Icons.info_outlined,
                          size: 45,
                        ),
                      ),
                      Style.spacing.sm,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.request.title,
                            style: Style.fieldStyle.titleBold.copyWith(
                              color: Style.theme.darkColor,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Style.spacing.sm,
                          Text(
                            widget.request.description,
                            style: Style.fieldStyle.title.copyWith(
                              color: Style.theme.primaryTextColor,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: Style.edgeInsets.vmd,
                            child: PrimaryTextField(
                              controller: _editController,
                              label: widget.request.editLabel ?? 'Digite aqui',
                              textInputType: TextInputType.text,
                              maxLines: 1,
                              obscureText: widget.request.obscureText,
                              onChanged: (_) {},
                              onSubmitted: (_) async {
                                Modular.to.pop();
                                await widget.request.onTap(_editController.text);
                              },
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: Style.edgeInsets.xlAll,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: Style.edgeInsets.rmin,
                          child: ExpressButton(
                            onTapped: () => Modular.to.pop(),
                            label: 'Cancelar',
                            backgroundColor: Style.theme.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ExpressButton(
                          onTapped: () async {
                            Modular.to.pop();

                            await widget.request.onTap(_editController.text);
                          },
                          label: 'Confirmar',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
