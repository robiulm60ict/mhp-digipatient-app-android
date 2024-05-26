class AppUrls {
  static const String googleTranslate = '';
  static const String appId = '1222006055';
  static const String appSign =
      'cf2a1ab2d6d433a3a3e99d076fafd27d42023c32b279fbff9b9b9cd525c96f29';

  static const String baseUrlPatientMain =
      'https://newgreatdoc.macrohealthplus.org'; //App live
  //
  static const String databasename = 'mhpdemocom'; //AppLive
  // 'mhpdemocom'; //AppLive

  // static const String databasename =
  //     'mhpdemocom_ZXJVT'; //Test
  // static const String baseUrlPatientMain =
  //     'https://sandbox.greatdoc-back.macrohealthplus.org'; //Test

  static const String baseUrlPatient = '$baseUrlPatientMain/api/v1';

  static const String auth = 'Authorization';
  static const String drprofile = '$baseUrlPatientMain/doctors/images/';

  static const String login = '$baseUrlPatient/login-patient';
  static const String doctorrequest =
      '$baseUrlPatient/patient-request-to-doctor/';

  static const String myDoctorslist =
      '$baseUrlPatient/patient-list-for-doctor/';
  static const String myDoctorslistclinic =
      '$baseUrlPatient/doctor-list-for-clinic/';
  static const String myDoctorsDeactivelist =
      '$baseUrlPatient/deactivated-doctors/';
  static const String activedoctor = '$baseUrlPatient/activate-doctor/';
  static const String deactivedoctor = '$baseUrlPatient/deactivate-doctor/';
  static const String docImage = "$baseUrlPatientMain/doctors/images/";
  static const String baseUrlResoures = 'https://server.macrohealthplus.org';
  static const String medical_education =
      '$baseUrlResoures/medicalEducation/get';
  static const String news_resoures = '$baseUrlResoures/newsAndViews/get';
  static const String webinares_resoures = '$baseUrlResoures/webinars/get';
  static const String patient_education_category =
      '$baseUrlResoures/category/get';
  static const String patient_education_subCategory =
      '$baseUrlResoures/subCategory/get/';
  static const String patient_education_resource =
      '$baseUrlResoures/resource/get/';
  static const String prescription_image =
      "$baseUrlPatientMain/images/online_prescription/";
  static const String report_image =
      "$baseUrlPatientMain/images/patients_reports/";
  static const String currentRX = "$baseUrlPatient/get-pescriped-dugs/";
  static const String getmyreportimage =
      "$baseUrlPatient/get-patient-report-file/";
  static const String uploadRXimage =
      "$baseUrlPatient/get-patient-prescriptions/";
  static const String prescrioption_greatdoc =
      "$baseUrlPatient/get-app-patient-prescription/";
  static const String uploadMyReport =
      "$baseUrlPatient/upload-patient-report-file";

  static const String pastRX = "$baseUrlPatient/past-dugs-history/";
  static const String socialacount = "$baseUrlPatient/social-media/";
  static const String doctorcountpatient =
      "$baseUrlPatient/doctor-list-for-patient-end/";

  /// user
  static const String userProfileUrl = "$baseUrlPatient/patients-profile/";
  static const String userUrlUpdate = "$baseUrlPatient/patient-info-update/";

  /// clinic

  static const String organization = '$baseUrlPatient/organization/';
  static const String deactiveorganization =
      '$baseUrlPatient/organization-inactive/';
  static const String serach_organization =
      '$baseUrlPatient/serach-organization';
  static const String deactive_organization =
      '$baseUrlPatient/organization-status-update/';
  static const String copy_patient_to_database =
      '$baseUrlPatient/copy-patient-to-database';
  static const String get_patient_details_from_organization =
      '$baseUrlPatient/get-patient-details-from-organization';

  /// image

  static const String image = "$baseUrlPatientMain/images/files/";

  /// book appointment

  static const String bookAppointment = '$baseUrlPatient/online-booking-app';
  static const String lab_request = '$baseUrlPatient/lab-request-from-app';

  /// Appointments

  static const String Appoinmentsqueue =
      '$baseUrlPatient/patient-appointment-queue-number';
  static const String todayAppointments =
      '$baseUrlPatient/todays-patientappointment/';
  static const String notification = '$baseUrlPatient/patient-notification/';

  static const String upcommingAppointments =
      '$baseUrlPatient/upcomming-patient-appointment/';

  /// Anatomy Symptoms

  static const String anatomySymptoms = '$baseUrlPatient/symptoms-anatomy';

  /// Doctor chamber time

  static const String docChamberTime =
      '$baseUrlPatient/doctor-chamber-times-for-app/';

  /// Medical History From Great Doc

  static const String mypayment = '$baseUrlPatient/patients-payment-details/';

  static const String mylab = '$baseUrlPatient/lab-request-from-app/';
  static const String medicalHistoryFromGreatDoc =
      '$baseUrlPatient/past-history/';

  static const String medicalProcedureFromGreatDoc =
      '$baseUrlPatient/great-doc-procedure/';

  static const String vitals = '$baseUrlPatient/patient-search-by-id/';

  static const String reasonForVisit = '$baseUrlPatient/get-great-doc-reson/';

  static const String saveVital = '$baseUrlPatient/save-vital-sign-patient';

  static const String addMedicalHistory = '$baseUrlPatient/past-history-save';

  static const String diagnosisProcedure =
      '$baseUrlPatient/diagnosis-procedure-reason/diagnosis';

  /// Registration

  static const String sendVerification =
      '$baseUrlPatient/send-verfication-code';
  static const String logout = '$baseUrlPatient/patient-logout';
  static const String sendVerificationForget =
      '$baseUrlPatient/send-verfication-code-forgot-password';

  static const String checkOtp = '$baseUrlPatient/verification-check';
  static const String newPassword = '$baseUrlPatient/patient-password-update';
  static const String checkOtpforget = '$baseUrlPatient/verification-check';
  static const String registration = '$baseUrlPatient/patient-registration';

  /// Blood Group and Birth Sex Patient

  static const String birthSex = '$baseUrlPatient/birth-sex';

  static const String bloodGroup = '$baseUrlPatient/blood-group';

  static const String invoiceView =
      '$baseUrlPatient/payement-request-for-patient/';

  static const String baseUrl =
      'https://dev.macrohealthplus.org/mhp_server/public';

  //TODO: set Edit user url
  static const String editUserUrl = "$baseUrl/api/edit-patients/";

  static const String loginAfterRegistration = '$baseUrl/api/login-patient';

  static const String allDoctors = '$baseUrl/api/doctors';

  static const String allPatients = '$baseUrl/api/patients';

  static const String saveDocFCM = '$baseUrl/api/doctor-app-token/';

  static const String savePtnFCM = '$baseUrl/api/patient-app-token/';

  static const String docFee =
      '$baseUrlPatientMain/api/doctors-consultation-Fee/';

  static const String department = '$baseUrlPatient/department';

  static const String departmentImage =
      '$baseUrl/mhp_server/public/department/';

  static const String singUpEndPoint = '$baseUrl/api/registration';

  static const String allSubBodyParts = '$baseUrl/api/sub-body-parts/head';

  static const String diseaseByGenderAndName =
      '$baseUrl/api/patient-symptomsByGender/';
}

const Map header = {'Accept': 'application/json'};
