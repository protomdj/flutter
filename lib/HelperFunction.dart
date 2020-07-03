class HelperFunction{

static bool emailvalidate(String email){

  var check = email;
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(check);
  return emailValid;
}

static bool passwordvalidate(String password){

  var check = password;
  bool passwordValid = RegExp(r"^[a-zA-Z0-9]").hasMatch(check);
  return passwordValid;
}

static bool fullnamevalidate(String fullname){

  var check = fullname;
  bool fullnameValid = RegExp(r"^[a-zA-Z0-9]").hasMatch(check);
  return fullnameValid;
}

} 