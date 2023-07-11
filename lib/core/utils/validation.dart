class Validation {
  static RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? emailValidation(String? value, {bool isRequired = true}) {
    if (value!.trim().isEmpty) {
      if (isRequired) {
        return 'هذا الحقل مطلوب';
      } else {
        return null;
      }
    } else if (!emailReg.hasMatch(value.trim())) {
      return 'ادخل بريد صحيح';
    } else {
      return null;
    }
  }

  RegExp passwordReg = RegExp(
      r'^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$');
  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    } else {
      if (!passwordReg.hasMatch(value.trim())) {
        return "يجب ادخال على الاقل 8 خانات ولابد ان تحتوى على حرف capital وعلامة مميزة مثل @ او # ";
      } else {
        return null;
      }
    }
  }

  String? phoneValidation(String? value) {
    String p = r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$';

    RegExp regExp = RegExp(p);
    if (value!.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (!regExp.hasMatch(value.trim())) {
      return ('رقم الهاتف غير صحيح');
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (password != value) {
      return ('رقم المرور غير متطابق');
    } else {
      return null;
    }
  }

  String? defaultValidation(value) {
    if (value == null || value!.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else {
      return null;
    }
  }

  String? taxNumberValidation(value, {bool isRequired = true}) {
    if (value!.isEmpty) {
      if (isRequired) {
        return 'هذا الحقل مطلوب';
      } else {
        return null;
      }
    } else {
      if (value.length != 15) {
        return ("wrongTaxNumberValidation");
      } else {
        return null;
      }
    }
  }
}
