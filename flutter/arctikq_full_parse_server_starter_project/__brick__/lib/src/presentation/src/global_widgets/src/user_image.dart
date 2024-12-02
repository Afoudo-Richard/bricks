import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';

class UserImage extends StatelessWidget {
  final bool isEditable;
  final bool isTest;

  final double? squareSize;
  final bool showEditIcon;

  const UserImage({
    super.key,
    this.isEditable = true,
    this.showEditIcon = false,
    this.isTest = false,
    this.squareSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isEditable
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SelectImageSourceDialog();
                },
              )
            : null;
      },
      child: BlocBuilder<UserImageBloc, UserImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, authState) {
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (context, userState) {
                      return CustomCircle(
                        padding: EdgeInsets.zero,
                        radius: squareSize ?? 40.sp,
                        child: isTest
                            ? Image.asset(
                                "assets/images/app_logo.png",
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: primaryColor,
                                    color: secondaryColor,
                                  ),
                                ),
                                imageUrl: authState.authenticated
                                    ? userState.user?.imageThumbnailUrl != null
                                        ? userState.user!.imageThumbnailUrl!
                                        : "https://ui-avatars.com/api/?name=${userState.user!.firstname}+${userState.user!.lastname}"
                                    : "https://ui-avatars.com/api/?name=Anonymous+A",
                              ),
                      );
                    },
                  );
                },
              ),
              showEditIcon
                  ? Positioned(
                      bottom: 0,
                      right: 5,
                      child: CustomCircle(
                        radius: 15.sp,
                        padding: EdgeInsets.all(1.sp),
                        color: primaryColor,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 10.sp,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              state.userImageStatus == UserImageStatus.uploading
                  ? Positioned(
                      bottom: 0,
                      left: 5,
                      child: LoadingIndicator(
                        radius: 10,
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
