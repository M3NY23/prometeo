import 'package:prometeo/data/models/prometeo/prometeo_game.dart';
import 'package:prometeo/domain/util/utils.dart';

class GameRepository {
  static PrometeoGame game = const PrometeoGame();
  static setNewGame(String name) {
    String timeStamp = getTimeStamp();
    game = PrometeoGame(name: name, timeStamp: timeStamp);
  }
}
