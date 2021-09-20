import 'package:flutter/cupertino.dart';

class AgentModels{
late String
agentId;
late String agentAddress;
late String   imageUrl="";
late String  agentPhone;
late String  agentEmail;
late String  officePhone;
late String  officeEmail;
late String officeAddress;
late String des;
late String name;
late int id;
AgentModels({required this.des,required this.agentAddress, required this.name,required this.agentEmail,required this.agentPhone,required this.agentId,
required this.officePhone,required this.id,  required this.imageUrl,required this.officeAddress});

factory AgentModels.fromJson(Map<String, dynamic> json){
  return AgentModels(agentPhone:json["real_estate_agent_office_number"],
      name:json["title"], agentEmail: json["real_estate_agent_email"],
     officePhone: json["real_estate_agent_office_number"].toString() ,
      des: json["real_estate_agent_description"],

      id: 3,agentId: json["agent_id"].toString(), imageUrl: json["logo"],
       officeAddress: json["real_estate_agent_office_address"], agentAddress: '');
  
}
}