
import 'package:contacts_with_bloc/models/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ListContactState extends Equatable{
  @override
  List<Object> get props => [];
}
class ListContactInit extends ListContactState{}

class ListContactLoading extends ListContactState{}

class ListContactLoaded extends ListContactState{

  late final List<Contact> contacts;
  late final bool? isDeleted;

  ListContactLoaded({required this.contacts,  this.isDeleted});

}

class ListContactError extends ListContactState{
  late final error;
  ListContactError({this.error});
}

