import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/firebase_options.dart';
import 'package:ar_market/utilities/routers.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp(MultiProvider(
    providers: [
      Provider<Database>(
        create: (_) =>
            FirestoreDatabase(FirebaseAuth.instance.currentUser!.uid),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerate,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? AppRoutes.loginPageRoute
          : AppRoutes.navBarPageRoute,
    );
  }
}
