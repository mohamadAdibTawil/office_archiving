import 'package:flutter/material.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/item_section_cubit/item_section_cubit.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';
import 'package:office_archiving/pages/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'service/sqlite_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SectionCubit(DatabaseProvider.instance)..getSections()),
        BlocProvider(
            create: (context) => ItemSectionCubit()..fetchItemsSections()),
      ],
      child: MaterialApp(
        title: officeArchiving,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
          fontFamily: kFontGTSectraFine,
        ),
        home: const SplashView(),
      ),
    );
  }
}
