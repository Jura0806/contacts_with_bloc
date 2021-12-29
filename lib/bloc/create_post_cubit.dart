

import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:contacts_with_bloc/services/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState>  {
  CreatePostCubit() : super(CreatePostInit());


  void apiPostCreate(Contact contact) async{
    print(contact.toJson());
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_Create,
        Network.paramsCreate(contact));
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}