import 'package:flutter/cupertino.dart';
import 'package:todo/domain/task/repository/interface/task_repository.dart';
import 'package:todo/domain/task/usecase/interface/task_usecase.dart';

enum AddTaskViewState {idling,success,failure}
class AddTaskViewModel extends ChangeNotifier {
  AddTaskViewModel(this.usecase)
      : titleController = TextEditingController(),
        descriptionController = TextEditingController() {
    titleController.addListener(() {});
    descriptionController.addListener(() {});
  }

  final TaskUsecase usecase;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  AddTaskViewState state = AddTaskViewState.idling;

  void save() {
    final params = CreateTaskParams(
        titleController.text, description: descriptionController.text);
    final result = usecase.addTask(params);
    print(result);
    if(result!=null){
      updateToBeSuccessfullyDone();
    }else {
      updateToBeFailed();
    }
  }

  void updateToBeSuccessfullyDone(){
    state = AddTaskViewState.success;
    notifyListeners();
  }
  void updateToBeFailed(){
    state = AddTaskViewState.failure;
    notifyListeners();
  }
}
