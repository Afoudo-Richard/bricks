import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Widget? titleWidget;
  final Widget? leading;
  final double? elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleWidget,
    this.leading,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingState) {
        return AppBar(
          excludeHeaderSemantics: true,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading ??
              (automaticallyImplyLeading
                  ? const LeadingPopCircle(
                      margin: EdgeInsets.only(
                        left: paddingSize,
                      ),
                    )
                  : null),
          elevation: elevation ?? 0.0,
          backgroundColor: settingState.isDarkMode
              ? darkSecondaryColor
              : backgroundColor ?? Colors.white,
          title: titleWidget ??
              Text(
                title,
                style: pageTitleTextStyle,
              ),
          centerTitle: centerTitle,
          actions: actions,
          iconTheme: IconThemeData(
            color: settingState.isDarkMode ? Colors.white : Colors.black,
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.sp);
}
