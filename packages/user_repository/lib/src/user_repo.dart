import 'package:user_repository/src/models/models.dart';

abstract class UserRepository{
  // each modthed call in lib root (bloc)

  // Stream for check the auth process of user
  Stream<MyUser?> get user;
  Future <MyUser> signUp(MyUser myUser, String password);
  Future <void> setUserData(MyUser user);
  Future<void> signIn(String email, String password);
  Future <void> logOut();


}