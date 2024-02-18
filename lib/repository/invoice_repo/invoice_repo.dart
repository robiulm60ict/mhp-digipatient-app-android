import 'package:digi_patient/model/invoice_model/invoice_show_model.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../resources/app_url.dart';

class InvoiceRepo{

  BaseApiService apiService = NetworkApiService();

  Future<List<InvoiceShowModel>> getInvoiceList(String id,contex) async{

    try{
      dynamic response = await apiService.getGetApiResponsecontext(AppUrls.invoiceView + id,contex);
      List<InvoiceShowModel> invoiceList = [];

      for (var i in response['data']){
        invoiceList.add(InvoiceShowModel.fromJson(i));
      }
      return invoiceList;
    }catch(e){
      rethrow;
    }
  }
}