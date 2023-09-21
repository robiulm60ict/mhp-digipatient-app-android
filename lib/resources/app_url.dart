
class AppUrls{

  static const String googleTranslate = '';

  static const String baseUrl = 'https://dev.macrohealthplus.org';

  static const String baseAddApi = '/mhp_server/public/api/';

  static const String bearer = 'Bearer ';

  static const String auth = 'Authorization';

  static const String login = '$baseUrl/mhp_server/public/api/login';

  static const String allDoctors = '$baseUrl/mhp_server/public/api/doctors';

  static const String allPatients = '$baseUrl/mhp_server/public/api/patients';
  
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

  //TODO: set Edit user url
  static const String editUserUrl = "$baseUrl/mhp_server/public/api/edit-patients/";

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

  static const String reasonForVisit = '$baseUrl/mhp_server/public/api/get-great-doc-reson/';

  static const String saveVital = '$baseUrl/mhp_server/public/api/save-vital-sign-patient';

  static const String addMedicalHistory = '$baseUrl/mhp_server/public/api/past-history-save';

  static const String diagnosisProcedure = '$baseUrl/mhp_server/public/api/diagnosis-procedure-reason/diagnosis';

  /// Registration

  static const String sendVerification = '$baseUrl/mhp_server/public/api/send-verfication-code';

  static const String checkOtp = '$baseUrl/mhp_server/public/api/verification-check';

  static const String registration = '$baseUrl/mhp_server/public/api/patient-sign-up';

  static const String loginAfterRegistration = '$baseUrl/mhp_server/public/api/login-patient';

  /// Blood Group and Birth Sex Patient

  static const String birthSex = '$baseUrl/mhp_server/public/api/birth-sex';

  static const String bloodGroup = '$baseUrl/mhp_server/public/api/blood-group';

  static const String invoiceView = '$baseUrl/mhp_server/public/api/online-booking-app-payment-details/';

/// video call
  static const String videoCall = 'http://35.240.201.91:8010/api/generate-agora-token';

}

const Map header = {'Accept': 'application/json'};