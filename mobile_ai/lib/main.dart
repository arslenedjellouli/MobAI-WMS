import 'package:flutter/material.dart';
import 'package:mobile_ai/config/di/injection_container.dart' as di;
import 'package:mobile_ai/config/theme/app_theme.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.init();

  runApp(const MobAIApp());
}

class MobAIApp extends StatelessWidget {
  const MobAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobAI WMS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
