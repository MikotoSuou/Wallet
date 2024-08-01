
import 'package:wallet/core/di/di.dart';

import '../../features/home/domain/usecases/get_user_usecase.dart';

void initHomeDependencies() {
  if(!instance.isRegistered<GetUserUseCase>()) {
    instance.registerFactory<GetUserUseCase>(() => GetUserUseCase(instance()));
  }
}
