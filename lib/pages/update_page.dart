

import 'package:contacts_with_bloc/bloc/update_post_cubit.dart';
import 'package:contacts_with_bloc/bloc/update_post_state.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:contacts_with_bloc/view/view_of_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatelessWidget {
  Contact contact;
  UpdatePage({required this.contact});


  TextEditingController nameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }


  @override
  Widget build(BuildContext context) {
    nameController.text = contact.fullname;
    numberController.text = contact.number;

    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if(state is UpdatePostLoading){
              String name = nameController.text.toString();
              String number = numberController.text.toString();
              Contact contact = Contact(id: this.contact.id, fullname: name, number: number);
              return viewOfUpdate(true,context,contact, nameController, numberController);
            }
            if(state is UpdatePostLoaded){
              _finish(context);
            }
            if(state is UpdatePostError){
            }
            return viewOfUpdate(false,context, contact, nameController, numberController);
          },
        ),
      ),
    );
  }
}
