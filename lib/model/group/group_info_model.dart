import 'package:drosak_managment_app/model/group/group_details.dart';

import 'appointment_model.dart';

class GroupInfoModel {
  GroupDetails groupDetails;
  List<AppointmentModel> listAppointment;

  GroupInfoModel({required this.groupDetails, required this.listAppointment});

  @override
  String toString() {
    return 'GroupInfoModel{groupDetails: $groupDetails, listAppointment: $listAppointment}';
  }
}
