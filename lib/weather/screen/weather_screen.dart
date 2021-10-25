import 'package:digitalstreich_app/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digitalstreich App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
              return _buildInitialInputWidget(context);
            },
          )
        ),
      ),
    );
  }

  Widget buildColumnWithData(BuildContext context, WeatherLoaded weatherState) {
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

  Widget _buildInitialInputWidget(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'locationKey eingeben'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Es muss ein text eingegeben werden.";
              }
              return null;
            },
            onSaved: (String? value) {
              Navigator.of(context).pushNamed(
                '/weather',
              );
              _submitCityName(context, value!);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  // 168717
  void _submitCityName(BuildContext context, String cityName) {
    BlocProvider.of<WeatherBloc>(context)
    .add(GetWeather(cityName));
  }
}
