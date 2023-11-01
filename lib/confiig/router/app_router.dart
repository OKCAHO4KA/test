import 'package:go_router/go_router.dart';
import 'package:reto/presentation/screens/start_screen.dart';

final appRouter = GoRouter(initialLocation: '/start', routes: [
  GoRoute(path: '/start', builder: (context, state) => const StartScreen()),
]);
