part of 'get_app_meta_data_cubit.dart';

sealed class AppMetaDataState extends Equatable {
  const AppMetaDataState();

  @override
  List<Object> get props => [];
}

final class AppMetaDataInitialState extends AppMetaDataState {}

final class AppMetaDataLoadingState extends AppMetaDataState {}

final class AppMetaDataFailedState extends AppMetaDataState {
  final String code;
  const AppMetaDataFailedState(this.code);
  @override
  List<Object> get props => [code];
}

final class AppMetaDataOfflineState extends AppMetaDataState {}

final class AppMetaDataFetchedState extends AppMetaDataState {
  final AppMetaData appMetaData;
  const AppMetaDataFetchedState(this.appMetaData);
  @override
  List<Object> get props => [appMetaData];
}
