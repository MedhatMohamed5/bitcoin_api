import 'package:bitcoin_api/bloc/cubit/app_cubit.dart';
import 'package:bitcoin_api/bloc/cubit/app_states.dart';
import 'package:bitcoin_api/models/data_model.dart';
import 'package:bitcoin_api/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: AppCubit.get(context).getData,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppErrorState)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
        },
        builder: (context, state) {
          var appCubit = AppCubit.get(context);
          if (state is AppLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          return appCubit.dataModel == null
              ? errorContent(state as AppErrorState)
              : bodyContent(appCubit.dataModel);
        },
      ),
    );
  }

  Widget bodyContent(DataModel? dataModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last update: ${DateFormat().format(
              DateTime.parse(
                dataModel!.time!.updatedISO!,
              ),
            )} UTC',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dataModel.disclaimer!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ItemCard(currency: dataModel.bpi![index]),
              itemCount: dataModel.bpi!.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget errorContent(AppErrorState state) {
    return Center(
      child: Text('Something went wrong, please try again later!'),
    );
  }
}
