
class AppUrls{

  static const String googleTranslate = '';

  static const String baseUrl = 'https://dev.macrohealthplus.org';

  static const String baseAddApi = '/mhp_server/public/api/';

  static const String bearer = 'Bearer ';

  static const String auth = 'Authorization';

  static const String login = '$baseUrl/mhp_server/public/api/login-patient';

  static const String allDoctors = '$baseUrl/mhp_server/public/api/doctors';

  static const String docFee = '$baseUrl/mhp_server/public/api/doctors-consultation-Fee/';

  static const String department = '$baseUrl/mhp_server/public/api/department';

  static const String departmentImage = '$baseUrl/mhp_server/public/department/';

  // static const String loginApiEndPoint = '$baseUrl/api/login';

  static const String singUpEndPoint = '$baseUrl/api//registration';

  static const String allSubBodyParts = '$baseUrl/mhp_server/public/api/sub-body-parts/head';

  static const String diseaseByGenderAndName = '$baseUrl/mhp_server/public/api/patient-symptomsByGender/';

  static const String docImage = "$baseUrl/mhp_server/public/doctors/images/";

  static const String currentRX = "$baseUrl/mhp_server/public/api/get-pescriped-dugs/";

  static const String pastRX = "$baseUrl/mhp_server/public/api/past-dugs-history/";

  /// user
  static const String userUrl = "$baseUrl/mhp_server/public/api/edit-patients/";

  /// image

  static const String image = "$baseUrl/mhp_server/public/";

  /// book appointment

  static const String bookAppointment = '$baseUrl/mhp_server/public/api/online-booking-app';

  /// Appointments

  static const String todayAppointments = '$baseUrl/mhp_server/public/api/todays-patientappointment/';

  static const String upcommingAppointments = '$baseUrl/mhp_server/public/api/upcoming-patientappointment/';
  /// Anatomy Symptoms

  static const String anatomySymptoms = '$baseUrl/mhp_server/public/api/symptoms-anatomy';

  /// Doctor chamber time

  static const String docChamberTime = '$baseUrl/mhp_server/public/api/doctor-chamber-times/';

/// Medical History From Great Doc

  static const String medicalHistoryFromGreatDoc = '$baseUrl/mhp_server/public/api/past-history/';

  static const String medicalProcedureFromGreatDoc = '$baseUrl/mhp_server/public/api/great-doc-procedure/';

  static const String vitals = '$baseUrl/mhp_server/public/api/patient-search-by-id/';
}

const Map header = {'Accept': 'application/json'};