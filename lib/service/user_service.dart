import 'package:apex_blue_stack/model/user.dart';

class UserService {
  Future<User> getUser() async {
    User _user = User(
      username: "Flyingwolf",
      firstName: "Simon",
      lastName: "Baker",
      rating: 2250,
      tournamentPlayed: 34,
      tournamentWon: 9,
      tournamentPercentage: 26,
      url:
          "https://tse4.mm.bing.net/th/id/OIP.oOWTpnspqXTJlSfSEks8VAHaJ4?pid=ImgDet&rs=1",
    );
    await Future.delayed(Duration(seconds: 3));
    return _user;
  }
}
