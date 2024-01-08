import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'item_section_state.dart';

class ItemSectionCubit extends Cubit<ItemSectionState> {
  ItemSectionCubit() : super(ItemSectionInitial());
}
