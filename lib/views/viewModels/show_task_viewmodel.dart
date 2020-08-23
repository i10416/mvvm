import 'package:flutter/cupertino.dart';

enum ShowTaskViewType {show,edit}

class ShowTaskViewModel extends ChangeNotifier {

  ShowTaskViewType viewType = ShowTaskViewType.show;

}