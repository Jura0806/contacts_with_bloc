

import 'package:contacts_with_bloc/bloc/update_post_state.dart';
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:contacts_with_bloc/services/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Contact contact) async{
    print(contact.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_Update + contact.id.toString(), Network.paramsUpdate(contact));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}

