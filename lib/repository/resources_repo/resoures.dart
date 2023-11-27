
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/resources/medical_education_model.dart';
import '../../model/resources/news_resoures.dart';
import '../../model/resources/patient_education/patient_education_catagory.dart';
import '../../model/resources/patient_education/patient_education_resources.dart';
import '../../model/resources/patient_education/patient_education_subcatagory.dart';
import '../../model/resources/webviners_model.dart';
import '../../resources/app_url.dart';

class ResouresRepo {
  BaseApiService apiService = NetworkApiService();

  Future<List<MedicalEducationModel>> getmedicalResoures() async {
    try {
      dynamic response = await apiService
          .getGetApiResponseNoHader("${AppUrls.medical_education}");
      List<MedicalEducationModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(MedicalEducationModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<WebBinerModel>> getwebinarsResoures() async {
    try {
      dynamic response = await apiService
          .getGetApiResponseNoHader("${AppUrls.webinares_resoures}");
      List<WebBinerModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(WebBinerModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<NewsModel>> getnewsResoures() async {
    try {
      dynamic response =
          await apiService.getGetApiResponseNoHader("${AppUrls.news_resoures}");
      List<NewsModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(NewsModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<PatientEducationCatagory>> getpatientEducationCatagoryResoures() async {
    try {
      dynamic response =
      await apiService.getGetApiResponseNoHader("${AppUrls.patient_education_category}");
      List<PatientEducationCatagory> datalist = [];
      for (var i in response['data']) {
        datalist.add(PatientEducationCatagory.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
  Future<List<PatientEducationSubCatagory>> getpatientEducationSubCatagoryResoures(catagoryId) async {
    try {
      dynamic response =
      await apiService.getGetApiResponseNoHader("${AppUrls.patient_education_subCategory}$catagoryId");
      List<PatientEducationSubCatagory> datalist = [];
      for (var i in response['data']) {
        datalist.add(PatientEducationSubCatagory.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<PatientEducationResources>> getpatientEducationSResoures(subcatagoryId) async {
    try {
      dynamic response =
      await apiService.getGetApiResponseNoHader("${AppUrls.patient_education_resource}$subcatagoryId");
      List<PatientEducationResources> datalist = [];
      for (var i in response['data']) {
        datalist.add(PatientEducationResources.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
