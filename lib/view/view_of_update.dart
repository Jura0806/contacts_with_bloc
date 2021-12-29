

import 'package:contacts_with_bloc/bloc/update_post_cubit.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context,Contact contact,TextEditingController nameController, TextEditingController numberController){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "fullName",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                  hintText: "Number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(contact);
              },
              color: Colors.blue,
              child: Text(
                "Update a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}