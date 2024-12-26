// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'app_colors.dart';
import 'app_edge_insets.dart';
import 'app_images.dart';
import 'app_input_border.dart';
import 'app_size.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class Style {
  static AppColors? _theme;

  static AppColors get theme => _theme ?? AppColors.getInstance();

  static AppTextStyles? _fieldStyle;

  static AppTextStyles get fieldStyle => _fieldStyle ?? AppTextStyles.getInstance();

  static AppSize? _size;

  static AppSize get size => _size ?? AppSize.getInstance();

  static AppImages? _images;

  static AppImages get images => _images ?? AppImages.getInstance();

  static AppSpacing? _spacing;

  static AppSpacing get spacing => _spacing ?? AppSpacing.getInstance();

  static AppInputBorder? _inputBorder;

  static AppInputBorder get inputBorder => _inputBorder ?? AppInputBorder.getInstance();

  static AppEdgeInsets? _edgeInsets;

  static AppEdgeInsets get edgeInsets => _edgeInsets ?? AppEdgeInsets.getInstance();
}
