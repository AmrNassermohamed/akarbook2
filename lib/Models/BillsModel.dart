class BillsModel {
 
  late String realEstateInvoiceDate;
  late String price;
  late String title;
  late String invoiceStatus;
  late String package;
  late String realEstateInvoicePaymentType;
  
  BillsModel({required this.title,required this.package,required this.price,required this.invoiceStatus
  ,required this.realEstateInvoiceDate,required this.realEstateInvoicePaymentType});

  factory BillsModel.fromJson(Map<String, dynamic> json){

 return BillsModel(package: json["package"], price: json["price"],
     invoiceStatus: json["invoice_status"].toString(),
     title: json["title"],
     realEstateInvoiceDate: json["real_estate_invoice_date"],
     realEstateInvoicePaymentType: json["real_estate_invoice_payment_type"]);
 
  }
}