class QRCodePopupRequest {
  final String textHelp;
  final String textQrCode;
  final String textNotes;
  final String? confirmText;
  final String? logoUrl;
  final Function()? ontap;

  const QRCodePopupRequest({
    required this.textHelp,
    required this.textQrCode,
    required this.textNotes,
    this.confirmText,
    this.logoUrl,
    this.ontap,
  });
}
