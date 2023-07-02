// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:presence/components/constant.dart';
import 'package:presence/providers/Individual_attendee_provider.dart';
import 'package:presence/providers/group_Provider.dart';
import 'package:provider/provider.dart';

class ManageAttendeeTile extends StatefulWidget {
  // final bool? showToogle;

  // const Individual_tile({super.key, this.showToogle});
  // const ManageAttendeeTile({Key? key}) : super(key: key);
  final int attendeeIndex;
  final int groupIndex;
  final Map attendee;

  const ManageAttendeeTile(
      {super.key,
      required this.attendee,
      required this.attendeeIndex,
      required this.groupIndex});
  // final String attendeeName;

  // const ManageAttendeeTile({super.key, required this.index});

  @override
  State<ManageAttendeeTile> createState() => _ManageAttendeeTileState();
}

class _ManageAttendeeTileState extends State<ManageAttendeeTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AttendeeProvider, GroupProvider>(
      builder: (context, AttendeeVariable, groupProviderVariable, child) {
        return Container(
          margin: EdgeInsets.only(bottom: 25),
          width: double.maxFinite,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 7,
                spreadRadius: 1,
                color: Colors.grey.shade500,
                offset: Offset(2, 6)),
          ]),
          // height: 80,

          child: Slidable(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.tilebackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                  // title: Text(
                  // "${AttendeeVariable.attendeeName[widget.index]["name"]}"),
                  title: Text(widget.attendee["name"]),
                  subtitle: Text("Present Days:  0 / 0"),
                  //
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        'https://www.google.com/search?q=avatar+url&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiegO6ty-X8AhXMI7cAHZr3AU8Q_AUoAXoECAEQAw&biw=1536&bih=754&dpr=1.25#imgrc=YYYLguVFuko0CM'),
                  ),
                  trailing: Icon(Icons.room_preferences_outlined)),
            ),
            endActionPane: ActionPane(
              children: [
                SlidableAction(
                  // padding: EdgeInsets.all(10),
                  onPressed: (context) {
                    setState(() {
                      groupProviderVariable.deleteAttendeeFromGroup(
                          widget.groupIndex,
                          widget.attendeeIndex,
                          widget.attendee["name"]);
                    });
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: null,
                  backgroundColor: Color.fromARGB(255, 33, 202, 89),
                  foregroundColor: Colors.white,
                  icon: Icons.phone,
                  label: 'Contact',
                ),
              ],
              motion: ScrollMotion(),
            ),
          ),
        );
      },
    );
  }
}