// ignore_for_file: cascade_invocations

import 'package:gestao_eventos/data/datasources/i_categoria_datasource.dart';
import 'package:gestao_eventos/data/datasources/i_evento_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/firebase_categoria_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/firebase_evento_datasource.dart';
import 'package:gestao_eventos/data/repositories/categoria_repository.dart';
import 'package:gestao_eventos/domain/repositories/i_categoria_repository.dart';
import 'package:gestao_eventos/domain/repositories/i_evento_repository.dart';
import 'package:gestao_eventos/domain/usecases/categoria_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_categoria_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_evento_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void registerDependencys() {
  // register categorie classes
  getIt
    ..registerLazySingleton<ICategoriaDataSource>(
      () => FirebaseCategoriaDataSource(
        firestore: getIt(),
      ),
    )
    ..registerLazySingleton<ICategoriaRepository>(
      () => CategoriaRepository(
        getIt(),
      ),
    )
    ..registerLazySingleton<ICategoriaUseCases>(
      () => CategoriaUseCase(
        getIt(),
      ),
    );

  // register evento classes
  getIt
    ..registerLazySingleton<IEventoDataSource>(
      () => getIt<FirebaseEventoDataSource>(),
    )
    ..registerLazySingleton<IEventoRepository>(
      () => getIt(),
    )
    ..registerLazySingleton<IEventoUseCases>(
      () => getIt(),
    );
}
