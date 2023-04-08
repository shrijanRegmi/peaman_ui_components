import 'package:peaman_ui_components/peaman_ui_components.dart';

extension PeamanUserExt on PeamanUser {
  String get genderStringSubject {
    var value = 'they';
    switch (gender) {
      case PeamanGender.male:
        value = 'he';
        break;
      case PeamanGender.female:
        value = 'she';
        break;
      default:
    }
    return value;
  }

  String get genderStringObject {
    var value = 'they';
    switch (gender) {
      case PeamanGender.male:
        value = 'he';
        break;
      case PeamanGender.female:
        value = 'she';
        break;
      default:
    }
    return value;
  }

  String get genderStringPossessive {
    var value = 'their';
    switch (gender) {
      case PeamanGender.male:
        value = 'his';
        break;
      case PeamanGender.female:
        value = 'her';
        break;
      default:
    }
    return value;
  }

  String get genderStringImage {
    var value = 'assets/images/avatar_boy.png';
    switch (gender) {
      case PeamanGender.female:
        value = 'assets/images/avatar_girl.png';
        break;
      default:
    }
    return value;
  }
}
