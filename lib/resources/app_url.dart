
class AppUrls{

  static const String googleTranslate = '';

   static const String baseUrl = 'https://dev.macrohealthplus.org/mhp_server/public';
   static const String baseUrlIP = 'http://35.213.180.244:7000';
   static const String baseUrlPatient = 'http://35.213.180.244:7000/api/v1';

  static const String baseAddApi = '/mhp_server/public/api/';

  static const String bearer = 'Bearer ';

  static const String auth = 'Authorization';
  static const String drprofile = 'http://35.213.180.244:7000/api/doctors/';


    static const String login = '$baseUrlPatient/login-patient';
    static const String doctorrequest = '$baseUrlPatient/patient-request-to-doctor/';
   // static const String login = '$baseUrlIP/api/login';
 // static const String login = '$baseUrlIP/api/login-with-saas';

  static const String myDoctorslist = '$baseUrlPatient/patient-list-for-doctor/';
  static const String allDoctors = '$baseUrl/api/doctors';

  static const String allPatients = '$baseUrl/api/patients';

  static const String saveDocFCM = '$baseUrl/api/doctor-app-token/';

  static const String savePtnFCM = '$baseUrl/api/patient-app-token/';

  static const String docFee = '$baseUrlIP/api/doctors-consultation-Fee/';

  static const String department = '$baseUrlIP/api/department';

  static const String departmentImage = '$baseUrl/mhp_server/public/department/';

  // static const String loginApiEndPoint = '$baseUrl/api/login';

  static const String singUpEndPoint = '$baseUrl/api/registration';

  static const String allSubBodyParts = '$baseUrl/api/sub-body-parts/head';

  static const String diseaseByGenderAndName = '$baseUrl/api/patient-symptomsByGender/';

  static const String docImage = "http://35.213.180.244:7000/doctors/images/";

  static const String currentRX = "$baseUrl/api/get-pescriped-dugs/";

  static const String pastRX = "$baseUrl/api/past-dugs-history/";

  /// user
  static const String userProfileUrl = "$baseUrlPatient/patients-profile/";
  static const String userUrl = "$baseUrl/api/edit-patients/";

  //TODO: set Edit user url
  static const String editUserUrl = "$baseUrl/api/edit-patients/";

  /// image

  static const String image = "$baseUrlIP/images/files/";

  /// book appointment

  static const String bookAppointment = '$baseUrlPatient/online-booking-app';

  /// Appointments

  static const String todayAppointments = '$baseUrl/api/todays-patientappointment/';

  static const String upcommingAppointments = '$baseUrl/api/upcoming-patientappointment/';
  /// Anatomy Symptoms

  static const String anatomySymptoms = '$baseUrlPatient/symptoms-anatomy';

  /// Doctor chamber time

  static const String docChamberTime = '$baseUrlPatient/doctor-chamber-times/';

/// Medical History From Great Doc

  static const String medicalHistoryFromGreatDoc = '$baseUrlIP/api/past-history/';

  static const String medicalProcedureFromGreatDoc = '$baseUrlIP/api/great-doc-procedure/';

  static const String vitals = '$baseUrl/api/patient-search-by-id/';

  static const String reasonForVisit = '$baseUrlIP/api/get-great-doc-reson/';

  static const String saveVital = '$baseUrl/api/save-vital-sign-patient';

  static const String addMedicalHistory = '$baseUrl/api/past-history-save';

  static const String diagnosisProcedure = '$baseUrl/api/diagnosis-procedure-reason/diagnosis';

  /// Registration

  static const String sendVerification = '$baseUrlPatient/send-verfication-code';

  static const String checkOtp = '$baseUrlPatient/verification-check';

  static const String registration = '$baseUrlPatient/patient-registration';

  static const String loginAfterRegistration = '$baseUrl/api/login-patient';

  /// Blood Group and Birth Sex Patient

  static const String birthSex = '$baseUrlPatient/birth-sex';

  static const String bloodGroup = '$baseUrlPatient/blood-group';

  static const String invoiceView = '$baseUrl/api/online-booking-app-payment-details/';

/// video call
  static const String videoCall = 'http://35.240.201.91:8010/api/generate-agora-token';

}

const Map header = {'Accept': 'application/json'};