import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/home_page.dart';
import 'package:todo_firebase/theme/colors/light_colors.dart';
import 'package:todo_firebase/widgets/back_button.dart';
import 'package:todo_firebase/widgets/my_text_field.dart';
import 'package:todo_firebase/widgets/top_container.dart';

class CreateNewTaskPage extends StatelessWidget {
  const CreateNewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 300,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const MyBackButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Create new task',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 18),
                  MyTextField(
                    label: 'Title',
                    icon: const Icon(null),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: MyTextField(
                          label: 'Date',
                          icon: downwardIcon,
                          controller:
                              TextEditingController(), // Added this line
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () async {
                          DateTimeRange? pickedDateRange =
                              await showDateRangePicker(
                            context: context,
                            initialDateRange: DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(const Duration(days: 7)),
                            ),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDateRange != null) {
                            print(
                                pickedDateRange); // Seçilen tarih aralığını kullanın
                          }
                        },
                        child: HomePage.calendarIcon(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: MyTextField(
                            label: 'Start Time',
                            icon: downwardIcon,
                            controller:
                                TextEditingController(), // Added this line
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: MyTextField(
                            label: 'End Time',
                            icon: downwardIcon,
                            controller:
                                TextEditingController(), // Added this line
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      label: 'Description',
                      minLines: 3,
                      maxLines: 3,
                      icon: const Icon(null),
                      controller: TextEditingController(), // Added this line
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            alignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            runSpacing: 0,
                            spacing: 10.0,
                            children: <Widget>[
                              Chip(
                                label: Text("SPORT APP"),
                                backgroundColor: LightColors.kRed,
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              Chip(
                                label: Text("MEDICAL APP"),
                              ),
                              Chip(
                                label: Text("RENT APP"),
                              ),
                              Chip(
                                label: Text("NOTES"),
                              ),
                              Chip(
                                label: Text("GAMING PLATFORM APP"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: width,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightColors.kBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
