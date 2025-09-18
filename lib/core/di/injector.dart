import 'package:get_it/get_it.dart';
import '../../features/orders/data/datasource/local_order_datasource.dart';
import '../../features/orders/data/datasource/order_datasource.dart';
import '../../features/orders/data/repos/order_repository_impl.dart';
import '../../features/orders/domain/repos/order_repository.dart';
import '../../features/orders/logic/order_cubit.dart';

final sl = GetIt.instance;

class Injector {
  static Future<void> setup() async {
    // Data sources
    sl.registerLazySingleton<OrderDataSource>(
      () => LocalOrderDataSource(),
    );

    // Repositories
    sl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(local: sl()),
    );

    // Cubit
    sl.registerFactory(() => OrderCubit(repository: sl()));
  }
}
