
import 'package:contacts_with_bloc/bloc/list_contact_cubit.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget itemOfList(BuildContext context, Contact contact){
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage("images/default_avatar.png"),
      ),
      title: Text(contact.fullname, style: TextStyle(color: Colors.white, fontSize: 20),),
      subtitle: Text(contact.number, style: TextStyle(color: Colors.white, fontSize: 17)),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 25,),
    ),
    actions: [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          BlocProvider.of<ListContactCubit>(context).callUpdatePage(context, contact);
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          BlocProvider.of<ListContactCubit>(context).deleteContactList(contact);
        },
      )
    ],
  );
}