import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class FetchError extends StatelessWidget {
  const FetchError({
    Key? key,
    this.message,
    this.errorButtonText,
    this.onPressedTryAgain,
  }) : super(key: key);

  final String? message;
  final String? errorButtonText;

  final void Function()? onPressedTryAgain;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                // color: secondaryColor,
                // height: 30.h,
                width: 40.w,
              ),
              2.h.ph,
              Text(
                message ?? 'Something went wrong while trying to fetch data',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: state.isDarkMode ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              2.h.ph,
              onPressedTryAgain != null
                  ? CustomButton(
                      backgroundColor: Colors.red,
                      onPressed: onPressedTryAgain,
                      child: Text(
                        errorButtonText ?? 'Retry',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
