import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';

class WeatherResultScreen extends StatelessWidget {
  const WeatherResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(9.0),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.message)
                  )
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Container();
            } else if (state is WeatherLoading) {
              return _buildLoadingWidget(context);
            } else if (state is WeatherLoaded) {
              return _showResultTextWidget(context, state);
            } else {
              // (state is WeatherError)
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _showResultTextWidget(BuildContext context, WeatherLoaded weatherState) {
    return Column(
      children: [
        Text(weatherState.weather.weatherDaily.text),
        Text(weatherState.weather.weatherForecast[0].weatherForecastTemperature.tempMax.value.toString()),
      ],
    );
  }


  Widget _buildLoadingWidget(BuildContext context) {
    return Dialog(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
          new Text("Loading"),
        ],
      ),
    );
  }
  
}
