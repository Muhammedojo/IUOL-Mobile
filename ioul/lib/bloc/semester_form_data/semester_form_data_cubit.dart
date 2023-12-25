import '../../model/model.dart';
import '../../packages/package.dart';
import 'cubit.dart';

class SemesterFormDataCubit extends Cubit<SemesterFormDataState> {
  SemesterFormDataCubit() : super(SemesterFormDataLoading());
  var register = Register();
}
