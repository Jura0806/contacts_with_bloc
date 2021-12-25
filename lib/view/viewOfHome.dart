
import 'package:flutter/material.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';

import 'item_of_list.dart';

Widget viewOfHome(List<Contact> items, bool isLoading){
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index){
          return itemOfList(ctx,items[index]);
        },
      ),
       isLoading ? Center(child: CircularProgressIndicator(),): SizedBox.shrink()
    ],
  );
}