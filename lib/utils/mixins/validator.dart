mixin FormValidationMixin {
  final passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  final upperCaseRegEx = RegExp(r'[A-Z]');

  final lowerCaseRegEx = RegExp(r'[a-z]');

  final numberRegEx = RegExp(r'[0-9]');

  final emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  // final mobileRegEx = RegExp(r'^[0-9]{10}$');
  final mobileRegex = RegExp(r'^\d{3}-\d{2}-\d{2}$');

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateString(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be  empty';
    }
    return null;
  }

  String? validateDropDown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select something';
    }
    return null;
  }

  String? validateJob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Job';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!mobileRegex.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!emailRegEx.hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!value.contains(upperCaseRegEx)) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!value.contains(lowerCaseRegEx)) {
      return 'Password must contain at least 1 lowercase letter';
    }

    if (!value.contains(numberRegEx)) {
      return 'Password must contain at least 1 number';
    }

    if (!passwordRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 9) {
      return 'Please enter a valid mobile number';
    }

    if (!mobileRegex.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }
}
