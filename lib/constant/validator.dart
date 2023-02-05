class Validator {
  static String emptyfield (String? s){
    if (s!.isEmpty){
      return "required field";
    }else{
      return "";
    }
  }
}