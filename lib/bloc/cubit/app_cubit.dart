import 'package:bitcoin_api/bloc/cubit/app_states.dart';
import 'package:bitcoin_api/models/data_model.dart';
import 'package:bitcoin_api/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitializaAppState());

  static AppCubit get(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);

  DataModel? dataModel;

  Future<void> getData() async {
    emit(AppLoadingState());
    try {
      var response = await DioHelper.getData(url: 'bpi/currentprice.json');
      if (response.statusCode == 200) {
        dataModel = DataModel.fromJson(json.decode(response.data));
        emit(AppSuccessState());
      } else {
        emit(AppErrorState(response.statusMessage));
      }
    } catch (err) {
      emit(AppErrorState(err.toString()));
    }
  }
}
