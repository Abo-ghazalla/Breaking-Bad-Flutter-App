part of 'imports.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(title: "Home"),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeError) {
              return const GetAllCharactersButton();
            } else if (state is HomeData) {
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 4),
                itemCount: state.characters.length,
                itemBuilder: (_, i) =>
                    CharacterWidget(character: state.characters[i]),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          listenWhen: (prev, current) => current is HomeError,
          listener: (_, c) {
            final error = (c as HomeError).msg;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error)));
          },
        ),
      ),
    );
  }
}
