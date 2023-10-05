import 'dart:async';
import 'package:get_it/get_it.dart';

//Favorece dependency inversion and single responsibility principles

FutureOr<void> initCore(GetIt sl) async {
  // sl
  // ..registerLazySingleton<IPlatformDatasource>(
  //   () => TrelloDatasource(),
  // )
  // ..registerLazySingleton<IPlatformRepository>(
  //   () => PlatformRepository(
  //     sl<IPlatformDatasource>(),
  //   ),
  // )
  // ..registerLazySingleton<GetUserUsecase>(() => GetUserUsecase(
  //       getUser: sl<IPlatformRepository>().getUserByToken,
  //     ))
  // ..registerLazySingleton<GetBoardUsecase>(
  //   () => GetBoardUsecase(
  //     getBoards: sl<IPlatformRepository>().getBoardsByUser,
  //   ),
  // )
  // ..registerLazySingleton<BoardBloc>(
  //   () => BoardBloc(
  //     getUserUsecase: sl<GetUserUsecase>(),
  //     getBoardUsecase: sl<GetBoardUsecase>(),
  //   ),
  // );
}
