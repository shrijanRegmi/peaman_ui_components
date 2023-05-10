import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanOnboardingDetailsInfoStep extends StatelessWidget {
  final DateTime? selectedBirthday;
  final PeamanGender selectedGender;
  final TextEditingController? bioController;
  final Function() onSelectBirthday;
  final Function() onSelectGender;

  const PeamanOnboardingDetailsInfoStep({
    Key? key,
    this.selectedBirthday,
    this.selectedGender = PeamanGender.unknown,
    this.bioController,
    required this.onSelectBirthday,
    required this.onSelectGender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PeamanInput(
            title: 'Birthday',
            hintText: 'Select Your Birthday',
            enabled: false,
            initialValue: selectedBirthday.isNull
                ? null
                : PeamanDateTimeHelper.getFormattedDate(selectedBirthday!),
            onPressed: onSelectBirthday,
            trailing: SvgPicture.asset(
              'assets/svgs/calendar.svg',
              height: 28.0,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          PeamanInput(
            title: 'Gender',
            hintText: 'Select Your Gender',
            enabled: false,
            initialValue: selectedGender == PeamanGender.unknown
                ? null
                : selectedGender == PeamanGender.male
                    ? 'Male'
                    : selectedGender == PeamanGender.female
                        ? 'Female'
                        : 'Other',
            onPressed: onSelectGender,
            trailing: selectedGender == PeamanGender.unknown ||
                    selectedGender == PeamanGender.other
                ? null
                : SvgPicture.asset(
                    selectedGender == PeamanGender.male
                        ? 'assets/svgs/gender_male.svg'
                        : 'assets/svgs/gender_female.svg',
                    height: 38.0,
                  ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          PeamanInput(
            title: 'Short Bio',
            hintText: 'About yourself',
            controller: bioController,
            trailing: const Icon(Icons.person_rounded),
            textInputType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            limit: 100,
          ),
        ],
      ),
    );
  }
}
