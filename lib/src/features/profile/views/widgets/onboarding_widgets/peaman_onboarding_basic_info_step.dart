import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/models/peaman_file_url_extended.dart';

class PeamanOnboardingBasicInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController userNameController;
  final Function() onImagePick;
  final Function() onCountryPick;
  final PeamanFileUrlExtended? profilePicture;
  final double profilePictureUploadProgress;
  final bool isProfilePictureUploaded;
  final String? country;

  const PeamanOnboardingBasicInfoStep({
    Key? key,
    required this.nameController,
    required this.userNameController,
    required this.onImagePick,
    required this.onCountryPick,
    this.profilePicture,
    this.profilePictureUploadProgress = 0.0,
    this.isProfilePictureUploaded = true,
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
        color: profilePicture != null ? null : PeamanColors.extraLightGrey,
        image: profilePicture == null
            ? null
            : DecorationImage(
                image: profilePicture!.isLocal
                    ? FileImage(
                        File(profilePicture!.url),
                      ) as ImageProvider
                    : CachedNetworkImageProvider(
                        profilePicture!.url,
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
                  profilePicture == null
                      ? profileImgWidget
                      : Hero(
                          tag: profilePicture!.url,
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
          visible: !isProfilePictureUploaded,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: PeamanProgressBuilder(
              profilePictureUploadProgress * 100.0,
              thickness: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
