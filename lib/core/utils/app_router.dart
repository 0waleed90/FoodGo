import 'package:delivery/feature/home/presentation/views/account_view/account_view.dart';
import 'package:delivery/feature/home/presentation/views/order_history_view/order_history_view.dart';
import 'package:delivery/feature/payment/presentation/view/checkout_view/checkout_view.dart';
import 'package:delivery/feature/payment/presentation/view/new_address_view/new_address_view.dart';
import 'package:delivery/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/presentation/views/cart_view/cart_view.dart';
import '../../feature/home/presentation/views/details_view/details_view.dart';
import '../../feature/home/presentation/views/home_view.dart';

class AppRouter {
  static final String kHomeView = '/HomeView';
  static final String kDetailsView = '/DetailsView';
  static final String kCartView = '/CartView';
  static final String kCheckoutView = '/CheckoutView';
  static final String kNewAddressView = '/NewAddressView';
  static final String kAccountView = '/AccountView';
  static final String kOrderHistory = '/OrderHistoryView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),

      GoRoute(path: kCartView, builder: (context, state) => CartView()),
      GoRoute(path: kCheckoutView, builder: (context, state) => CheckoutView()),
      GoRoute(
        path: kNewAddressView,
        builder: (context, state) => NewAddressView(),
      ),
      GoRoute(path: kAccountView, builder: (context, state) => AccountView()),
    GoRoute(path: kOrderHistory,builder: (context,state)=>OrderHistoryView())
    
    ],
  );
}
