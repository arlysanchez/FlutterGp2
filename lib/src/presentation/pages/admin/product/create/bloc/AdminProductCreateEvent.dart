import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/models/Category.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';

abstract class AdminProductCreateEvent extends Equatable {
  const AdminProductCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductCreateInitEvent extends AdminProductCreateEvent {
  final Category? category;
  const AdminProductCreateInitEvent({required this.category});
  @override
  List<Object?> get props => [category];
}

class NameChanged extends AdminProductCreateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminProductCreateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class PriceChanged extends AdminProductCreateEvent {
  final BlocFormItem price;
  const PriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminProductCreateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductCreateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminProductCreateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductCreateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}
