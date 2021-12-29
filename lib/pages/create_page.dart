

import 'package:contacts_with_bloc/bloc/create_post_cubit.dart';
import 'package:contacts_with_bloc/bloc/create_post_state.dart';
import 'package:contacts_with_bloc/view/view_of_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController nameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (BuildContext context, CreatePostState state) {
            if(state is CreatePostLoading){
              return viewOfCreate(true,context,nameController,numberController);
            }
            if(state is CreatePostLoaded){
              _finish(context);
            }
            if(state is CreatePostError){

            }
            return viewOfCreate(false,context,nameController,numberController);
          },
        ),
      ),
    );
  }
}
