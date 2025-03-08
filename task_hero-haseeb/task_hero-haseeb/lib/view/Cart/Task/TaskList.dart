import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/view/Cart/Task/TaskItem.dart';
import 'package:cocoon/view/Cart/Task/PostTask/getInfo.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isDeleteMode = false;
  List<int> selectedItems = [];
  int itemCount = 3;

  void toggleItemSelection(int index) {
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index);
      } else {
        selectedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() =>  const GetInfoPage ()); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(218, 255, 255, 255),
                  foregroundColor: AppColors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  fixedSize: const Size(250, 58),
                ),
                child: const Text(
                  "Post a task",
                  style: TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 22.4 / 16,
                    letterSpacing: 0.2,
                    color: AppColors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) => TaskItem(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
