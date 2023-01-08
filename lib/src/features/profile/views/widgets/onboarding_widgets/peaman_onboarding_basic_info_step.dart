import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanOnboardingBasicInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController userNameController;
  final Function() onImagePick;
  final Function() onCountryPick;
  final PeamanPicture? profileImg;
  final double profileImgUploadProgress;
  final bool profileImgUploadCompleted;
  final String? country;

  const PeamanOnboardingBasicInfoStep({
    Key? key,
    required this.nameController,
    required this.userNameController,
    required this.onImagePick,
    required this.onCountryPick,
    this.profileImg,
    this.profileImgUploadProgress = 0.0,
    this.profileImgUploadCompleted = true,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _profileImgBuilder(),
          const SizedBox(
            height: 20.0,
          ),
          PeamanInput(
            requiredPadding: false,
            controller: nameController,
            textCapitalization: TextCapitalization.words,
            title: 'Full Name',
          ),
          const SizedBox(
            height: 15.0,
          ),
          PeamanInput(
            requiredPadding: false,
            controller: userNameController,
            title: 'Username',
          ),
          const SizedBox(
            height: 15.0,
          ),
          PeamanInput(
            requiredPadding: false,
            initialValue: country,
            onPressed: onCountryPick,
            enabled: false,
            textCapitalization: TextCapitalization.words,
            title: 'Country',
            hintText: 'Select your country',
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileImgBuilder() {
    final profileImgWidget = Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: profileImg != null ? null : PeamanColors.extraLightGrey,
        image: profileImg == null
            ? null
            : DecorationImage(
                image: profileImg!.type == PeamanPictureType.file
                    ? FileImage(
                        File(profileImg!.path),
                      ) as ImageProvider
                    : CachedNetworkImageProvider(
                        profileImg!.path,
                      ),
                fit: BoxFit.cover,
              ),
      ),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onImagePick,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  profileImg == null
                      ? profileImgWidget
                      : Hero(
                          tag: profileImg!.path,
                          child: profileImgWidget,
                        ),
                  const Icon(
                    Icons.camera_alt,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Visibility(
          visible: !profileImgUploadCompleted,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: PeamanProgressBuilder(
              profileImgUploadProgress * 100.0,
              thickness: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
