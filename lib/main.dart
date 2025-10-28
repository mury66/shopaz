import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/cache/cache_helper.dart';
import 'package:shopaz_e_commerce/core/routes_manager/routes.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopaz_e_commerce/features/main_layout/favourite/presentation/bloc/favourite_bloc.dart';

import 'core/routes_manager/route_generator.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await CacheHelper.init();
  String? routeName = CacheHelper.getString("token");
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartBloc>()..add(GetCartItemsEvent())),
        BlocProvider(create: (context) => getIt<FavouriteBloc>()),
        BlocProvider(create: (context) => getIt<AuthBloc>())
      ],
      child: MainApp(initialRoute: routeName == null ? Routes.signInRoute : Routes.mainRoute)));
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  const MainApp({required this.initialRoute,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
