import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/simple_bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyC2oZnfsXStTIi46dlkXl_e4jVpijuAzf8',
    appId: '1:561120806243:android:710412d33dbebaa3b37f56',
    messagingSenderId: '561120806243',
    projectId: 'firstproject-19070',
    storageBucket: 'firstproject-19070.appspot.com',
  ));
  Bloc.observer = SimpleBlocObserver();
  runApp( MyApp(FirebaseUserRepo()));
}
/*


 */

