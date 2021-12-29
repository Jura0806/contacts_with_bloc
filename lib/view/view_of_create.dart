import 'package:contacts_with_bloc/bloc/create_post_cubit.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfCreate( bool isLoading, BuildContext context, TextEditingController nameController, TextEditingController numberController){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "fullname",
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
                Contact contact = Contact( number: numberController.text.toString(), fullname: nameController.text.toString(),  );
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(contact);
              },
              color: Colors.blue,
              child: Text(
                "Create a Post",
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