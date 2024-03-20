

import 'package:auto_route/auto_route.dart' hide MaterialRoute;

import 'auto_route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Screen,Route')
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true,
    children: [
      AutoRoute(page: GroceryNavigationRoute.page, children: [
            AutoRoute(page: GroceryRoute.page, initial: true),
            AutoRoute(page: GroceryDetailRoute.page, path: ':GroceryModel'),
            // AutoRoute(page: GroceryDetailRoute.page),
          ],
      ),
      AutoRoute(page: CartRoute.page),
    ]),
  ];
}