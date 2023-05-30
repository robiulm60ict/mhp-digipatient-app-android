import 'package:digi_patient/model/invoice_model/invoice_show_model.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../resources/app_url.dart';

class InvoiceRepo{

  BaseApiService apiService = NetworkApiService();

  Future<InvoiceShowModel> getInvoiceList(String id) async{

    try{
      dynamic response = await apiService.getGetApiResponse(AppUrls.invoiceView + id,);
      return InvoiceShowModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}