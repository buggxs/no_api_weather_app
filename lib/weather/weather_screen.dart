import 'package:digitalstreich_app/weather/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digitalstreich App"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: BlocConsumer<WeatherCubit, WeatherState>(
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
                return buildInitialInput(context);
              } else if (state is WeatherLoading) {
                return buildLoading(context);
              } else if (state is WeatherLoaded) {
                return buildColumnWithData(context, state);
              } else {
                // (state is WeatherError)
                return buildInitialInput(context);
              }
            },
          )
        ),
      ),
    );
  }

  Widget buildColumnWithData(BuildContext context, WeatherLoaded weatherState) {
    return Column(
      children: [
        Text(weatherState.weather.cityName, style: Theme.of(context).textTheme.headline1,),
        Text(weatherState.weather.temperatureCelsius.toString()),
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
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

  Widget buildInitialInput(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email.'
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text.";
              }
              return null;
            },
            onSaved: (String? value) {
              submitCityName(context, value!);
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

  void submitCityName(BuildContext context, String cityName) {
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    weatherCubit.getWeather(cityName);
  }
}
