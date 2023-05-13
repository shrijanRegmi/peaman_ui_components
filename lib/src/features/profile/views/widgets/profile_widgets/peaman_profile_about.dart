import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/shared/extensions/peaman_string_extension.dart';
import '../../../../shared/views/widgets/common_widgets/peaman_input_popup.dart';

class PeamanProfileAbout extends ConsumerStatefulWidget {
  const PeamanProfileAbout({
    super.key,
    required this.user,
    this.itemsBuilder,
    this.onPressedName,
    this.onPressedUserName,
    this.onPressedBio,
    this.onPressedGender,
    this.onPressedDob,
    this.onPressedCountry,
    this.onPressedLanguages,
    this.onPressedEmail,
  });

  final PeamanUser user;

  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Widget nameBuilder,
    Widget userNameBuilder,
    Widget bioBuilder,
    Widget genderBuilder,
    Widget dobBuilder,
    Widget countryBuilder,
    Widget languagesBuilder,
    Widget emailBuilder,
  )? itemsBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedName;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedUserName;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedBio;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedGender;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedDob;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedCountry;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedLanguages;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? onPressedEmail;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileAboutState();
}

class _PeamanProfileAboutState extends ConsumerState<PeamanProfileAbout> {
  PeamanInfoProvider get _logProvider =>
      ref.read(providerOfPeamanInfo.notifier);
  String get _uid =>
      ref.watch(providerOfLoggedInUser.select((value) => value.uid!));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.itemsBuilder?.call(
              context,
              ref,
              widget.user,
              _nameBuilder(),
              _userNameBuilder(),
              _bioBuilder(),
              _genderBuilder(),
              _dobBuilder(),
              _countryBuilder(),
              _languagesBuilder(),
              _emailBuilder(),
            ) ??
            [
              SizedBox(
                height: 10.h,
              ),
              if (widget.user.uid == _uid || widget.user.name != null)
                _nameBuilder(),
              if (widget.user.uid == _uid || widget.user.userName != null)
                _userNameBuilder(),
              if (widget.user.uid == _uid || widget.user.bio != null)
                _bioBuilder(),
              if (widget.user.uid == _uid ||
                  ksPeamanGender[widget.user.gender] != null)
                _genderBuilder(),
              if (widget.user.uid == _uid || widget.user.dob != null)
                _dobBuilder(),
              if (widget.user.uid == _uid || widget.user.country != null)
                _countryBuilder(),
              _languagesBuilder(),
              if (widget.user.uid == _uid || widget.user.email != null)
                _emailBuilder(),
              SizedBox(
                height: 100.h,
              ),
            ],
      ),
    );
  }

  Widget _nameBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.person_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Name',
      subtitle: widget.user.name!,
      onPressed: _onPressedEditName,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _userNameBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.label_important_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Username',
      subtitle: '@${widget.user.userName}',
      onPressed: _onPressedEditUsername,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _bioBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.label_important_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Short Bio',
      subtitle: widget.user.bio!,
      onPressed: _onPressedEditBio,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _genderBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          widget.user.gender == PeamanGender.female
              ? Icons.face_3_rounded
              : Icons.face_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Gender',
      subtitle: ksPeamanGender[widget.user.gender]!.capitalizeFirstLetter,
      onPressed: _onPressedEditGender,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _dobBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.calendar_today_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 14.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(12.5.w),
      ),
      title: 'Date of Birth',
      subtitle: PeamanDateTimeHelper.getFormattedDate(
        DateTime.fromMillisecondsSinceEpoch(widget.user.dob!),
      ),
      onPressed: _onPressedEditDateOfBirth,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _countryBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.flag_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Country',
      subtitle: widget.user.country!,
      onPressed: _onPressedEditCountry,
      trailing: widget.user.uid == _uid
          ? Icon(
              Icons.edit_rounded,
              color: PeamanColors.extraLightGrey,
              size: 16.w,
            ).pL(5)
          : null,
    );
  }

  Widget _languagesBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.language_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Languages',
      subtitle: 'Nepali, English, French, German',
    );
  }

  Widget _emailBuilder() {
    return PeamanProfileAboutItem(
      icon: PeamanRoundIconButton(
        icon: Icon(
          Icons.email_rounded,
          color: context.isDarkMode
              ? PeamanColors.white70
              : context.theme.colorScheme.primary,
          size: 18.w,
        ),
        bgColor: context.isDarkMode ? context.theme.colorScheme.primary : null,
        padding: EdgeInsets.all(10.w),
      ),
      title: 'Email',
      subtitle: widget.user.email!,
    );
  }

  void _onPressedEditName() {
    if (widget.onPressedName != null) {
      widget.onPressedName?.call(context, ref, widget.user);
      return;
    }

    if (widget.user.uid != _uid) return;

    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanInputPopup(
        title: 'Edit Name',
        initialValue: widget.user.name,
        textCapitalization: TextCapitalization.words,
        onPressedSubmit: (context, ref, val) {
          if (val.trim().isEmpty) {
            _logProvider.logError('Name cannot be empty');
            return;
          }
          _updateData(name: val);
        },
      ),
    );
  }

  void _onPressedEditUsername() {
    if (widget.onPressedUserName != null) {
      widget.onPressedUserName?.call(context, ref, widget.user);
      return;
    }
    if (widget.user.uid != _uid) return;

    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanInputPopup(
        title: 'Edit Username',
        initialValue: widget.user.userName,
        onPressedSubmit: (context, ref, val) {
          if (val.trim().isEmpty) {
            _logProvider.logError('Username cannot be empty');
            return;
          }
          _updateData(userName: val);
        },
      ),
    );
  }

  void _onPressedEditBio() {
    if (widget.onPressedBio != null) {
      widget.onPressedBio?.call(context, ref, widget.user);
      return;
    }

    if (widget.user.uid != _uid) return;

    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanInputPopup(
        title: 'Edit Short Bio',
        initialValue: widget.user.bio,
        textInputType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        limit: 130,
        onPressedSubmit: (context, ref, val) {
          if (val.trim().isEmpty) {
            _logProvider.logError('Short bio cannot be empty');
            return;
          }
          _updateData(bio: val);
        },
      ),
    );
  }

  void _onPressedEditGender() {
    if (widget.onPressedGender != null) {
      widget.onPressedGender?.call(context, ref, widget.user);
      return;
    }

    if (widget.user.uid != _uid) return;

    showPeamanSelectableOptionsBottomsheet(
      context: context,
      activeIndex: widget.user.gender == PeamanGender.male
          ? 0
          : widget.user.gender == PeamanGender.female
              ? 1
              : widget.user.gender == PeamanGender.other
                  ? 2
                  : null,
      optionsBuilder: (context, ref) {
        return [
          const PeamanSelectableOption(
            id: 0,
            title: 'Male',
          ),
          const PeamanSelectableOption(
            id: 1,
            title: 'Female',
          ),
          const PeamanSelectableOption(
            id: 2,
            title: 'Other',
          ),
        ];
      },
      onSelectOption: (context, ref, option) {
        switch (option.id) {
          case 0:
            _updateData(gender: PeamanGender.male);
            break;
          case 1:
            _updateData(gender: PeamanGender.female);
            break;
          case 2:
            _updateData(gender: PeamanGender.other);
            break;
          default:
        }
      },
    );
  }

  void _onPressedEditDateOfBirth() async {
    if (widget.onPressedDob != null) {
      widget.onPressedDob?.call(context, ref, widget.user);
      return;
    }

    if (widget.user.uid != _uid) return;

    final currentDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.user.dob != null
          ? DateTime.fromMillisecondsSinceEpoch(widget.user.dob!)
          : currentDate,
      firstDate: DateTime(1880, 1, 1),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      _updateData(dateOfBirth: pickedDate);
    }
  }

  void _onPressedEditCountry() {
    if (widget.onPressedCountry != null) {
      widget.onPressedCountry?.call(context, ref, widget.user);
      return;
    }

    if (widget.user.uid != _uid) return;

    return showCountryPicker(
      context: context,
      onSelect: (country) => _updateData(
        country: country,
      ),
    );
  }

  void _updateData({
    final String? name,
    final String? userName,
    final String? bio,
    final PeamanGender? gender,
    final DateTime? dateOfBirth,
    final Country? country,
  }) {
    if (widget.user.uid != _uid) return;

    ref.read(providerOfPeamanUser.notifier).updateUser(
      fields: [
        if (name != null)
          PeamanField(
            key: 'name',
            value: name,
          ),
        if (userName != null)
          PeamanField(
            key: 'userName',
            value: userName,
          ),
        if (bio != null)
          PeamanField(
            key: 'bio',
            value: bio,
          ),
        if (gender != null)
          PeamanField(
            key: 'gender',
            value: ksPeamanGender[gender],
          ),
        if (dateOfBirth != null)
          PeamanField(
            key: 'dob',
            value: dateOfBirth.millisecondsSinceEpoch,
          ),
        if (country != null)
          PeamanField(
            key: 'countryDetailed',
            value: country.toJson(),
          ),
        if (country != null)
          PeamanField(
            key: 'country',
            value: country.name,
          ),
      ],
    );
  }
}
