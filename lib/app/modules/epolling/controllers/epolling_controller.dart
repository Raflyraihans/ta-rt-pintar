import 'package:get/get.dart';
import 'package:rtkita/app/model/polling.dart';

class EpollingController extends GetxController {
  List<Polling?> polling = [];
  // ignore: prefer_typing_uninitialized_variables
  var dataPolling;
  bool newData = false;

  bool alreadyVote = false;

  setNewDataStatus(status) {
    newData = status;
    update();
  }

  setPolling(List<Polling?> data) {
    polling = data;
    update();
  }

  updateVote(bool vote) {
    alreadyVote = vote;
    update();
  }

  setDataPolling(data) {
    dataPolling = data;
    update();
  }
}
