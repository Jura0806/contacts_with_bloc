import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:contacts_with_bloc/services/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_contact_state.dart';

class ListContactCubit extends Cubit<ListContactState> {
  ListContactCubit(ListContactInit initialState) : super(initialState);

  void apiPostList() async {
    emit(ListContactLoading());
    var response = await Network.GET(Network.paramsEmpty());
    print(response);
    if (response != null) {
      emit(ListContactLoaded(contacts: Network.parseContactList(response)));
    } else {
      emit(ListContactError(error: "Could not fetch contacts"));
    }
  }

  void deleteContactList(Contact contact) async {
    var response = await Network.Del(Network.API_Delete + contact.id.toString(), Network.paramsEmpty());
    print("DeletePost => ${response.toString()}");
      if(response != null){
        apiPostList();
      }
      emit(ListContactError(error: "Could not fetch contacts"));
  }
}
