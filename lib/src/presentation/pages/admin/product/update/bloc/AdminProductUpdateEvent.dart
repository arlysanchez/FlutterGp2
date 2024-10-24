import 'package:equatable/equatable.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/presentation/utils/BlocFormItem.dart';

abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent {
  final Product? product;
  const AdminProductUpdateInitEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class NameChanged extends AdminProductUpdateEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminProductUpdateEvent {
  final BlocFormItem description;
  const DescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class PriceChanged extends AdminProductUpdateEvent {
  final BlocFormItem price;
  const PriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class FormSubmit extends AdminProductUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminProductUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}

class PickImage extends AdminProductUpdateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductUpdateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}
