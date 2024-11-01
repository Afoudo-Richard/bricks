import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class FetchEmpty extends StatelessWidget {
  const FetchEmpty({
    Key? key,
    this.message,
    this.emptyButtonText,
    this.onPressedRefresh,
  }) : super(key: key);

  final String? message;
  final String? emptyButtonText;

  final void Function()? onPressedRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/noData1.svg',
          // color: secondaryColor,
          // height: 30.h,
          width: 60.w,
        ),
        2.h.ph,
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Text(
              message ?? 'Nothing found',
              style: TextStyle(
                fontSize: 15.sp,
                color: state.isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
        2.h.ph,
        onPressedRefresh != null
            ? CustomButton(
                backgroundColor: Colors.red,
                onPressed: onPressedRefresh,
                child: Text(
                  emptyButtonText ?? 'Refresh',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
