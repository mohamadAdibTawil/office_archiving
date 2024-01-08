import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:office_archiving/constants.dart';
import 'package:office_archiving/cubit/section_cubit/section_cubit.dart';
import 'package:office_archiving/models/item.dart';
import 'package:office_archiving/models/section.dart';
import 'package:office_archiving/pages/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SectionAdapter());
  await Hive.openBox<Section>(kSectionBox);
  Hive.registerAdapter(ItemSectionAdapter());
  await Hive.openBox<ItemSection>(kItemSectionBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SectionCubit()..fetchSections()),
      ],
      child: MaterialApp(
        title: officeArchiving,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
          fontFamily: kFontGTSectraFine,
        ),
        home: const Directionality(
            textDirection: TextDirection.rtl, child: SplashView()),
      ),
    );
  }
}
