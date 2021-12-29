import 'package:contacts_with_bloc/bloc/list_contact_cubit.dart';
import 'package:contacts_with_bloc/bloc/list_contact_state.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:contacts_with_bloc/view/viewOfHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListContactCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Contacts"),
          backgroundColor: Colors.blueGrey.shade400,
        ),
        body: BlocBuilder<ListContactCubit, ListContactState>(
          builder: (BuildContext context, ListContactState state) {
            if (state is ListContactError) {
              return viewOfHome(items, true);
            }
            if (state is ListContactLoaded) {
              items = state.contacts;
              return viewOfHome(items, false);
            }
            return viewOfHome(items, true);
          },
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade700,
        child: Icon(Icons.add),
        onPressed: (){
          BlocProvider.of<ListContactCubit>(context).callCreatePage(context);
        },
      ),
    );
  }
}
