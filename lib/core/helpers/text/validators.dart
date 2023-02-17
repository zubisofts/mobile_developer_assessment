class Validators {
  Validators._();

  static String email(String? str) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (str == null) {
      return 'This field is required';
    } else {
      if (str.isEmpty) return 'This field is required';
      if (!regex.hasMatch(str)) return 'Email format is invalid';
      return '';
    }
  }

  static String phone(String? str) {
    Pattern pattern =
        r'^(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d+)\)?)[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?)+)(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$';
    RegExp regex = RegExp(pattern.toString());

    if (str == null) {
      return 'This field is required';
    } else {
      if (str.isEmpty) return 'This field is required';
      if (str.length < 11) {
        return 'Phone number must be at least 11';
      }
      if (!regex.hasMatch(str)) return 'Phone number format is invalid';
      return '';
    }
  }

  static String password(String? value) {
    if (value == null) {
      return 'Password is required';
    } else {
      if (value.isEmpty) {
        return 'Password is required';
      }
      if (value.length <= 5) {
        return 'Password must be more than 5 chars';
      }
      return '';
    }
  }

  static String nin(String? value) {
    if (value!.length < 11) {
      return 'NIN must be 11 characters';
    }
    return '';
  }

  static String bvn(String? value) {
    if (value == null) {
      return 'This field is required';
    } else {
      if (value.isEmpty) {
        return 'This field is required';
      }
      if (value.length < 11) {
        return 'BVN must be 11 characters';
      }
      return '';
    }
  }

  static String text(String? value) {
    if (value == null) {
      return 'This field is required';
    } else {
      if (value.isEmpty) {
        return 'This field is required';
      }
      return '';
    }
  }
}
