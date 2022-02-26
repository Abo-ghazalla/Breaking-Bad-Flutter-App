import 'package:breaking_bad_app/view/screens/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllCharactersButton extends StatelessWidget {
  const GetAllCharactersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: context.read<HomeCubit>().allCharacters,
        child: const Text("All Characters"),
        style: ElevatedButton.styleFrom(),
      ),
    );
  }
}
