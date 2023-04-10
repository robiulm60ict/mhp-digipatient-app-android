
class AppUrls{

  static const String googleTranslate = '';

  static const String baseUrl = 'https://dev.macrohealthplus.org';

  static const String baseAddApi = '/mhp_server/public/api/';

  static const String bearer = 'Bearer ';

  static const String auth = 'Authorization';

  static const String login = '$baseUrl/mhp_server/public/api/login-patient';

  static const String allDoctors = '$baseUrl/mhp_server/public/api/doctors';

  static const String department = '$baseUrl/mhp_server/public/api/department';

  static const String departmentImage = '$baseUrl/mhp_server/public/department/';

  // static const String loginApiEndPoint = '$baseUrl/api/login';

  static const String singUpEndPoint = '$baseUrl/api//registration';

  static const String allSubBodyParts = '$baseUrl/mhp_server/public/api/sub-body-parts/head';

  static const String diseaseByGenderAndName = '$baseUrl/mhp_server/public/api/patient-symptomsByGender/';

  static const String docImage = "$baseUrl/mhp_server/public/doctors/images/";
}

const Map header = {'Accept': 'application/json'};