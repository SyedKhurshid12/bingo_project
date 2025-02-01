import 'package:bingo_project/AppConstData/app_colors.dart';
import 'package:bingo_project/AppConstData/helper_function.dart';
import 'package:bingo_project/controllers/topic_question_controller.dart';
import 'package:bingo_project/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class QuestionsScreen extends StatefulWidget {
  final String topicId;

  const QuestionsScreen({super.key, required this.topicId});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final TopicQuestionController _controller = Get.put(TopicQuestionController());
  PageController _pageController = PageController();
  int correctIndex = -1;
  int selectedIndex = -1;
  bool? showAdditonalText;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.fetchTopicQuestion(widget.topicId); // Trigger the API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "",
        showBackIcon: true,
        titleColor: Colors.black,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_controller.GetTopicQuestion.value.isEmpty) {
          return const Center(child: Text('No items available.'));
        }

        // Get the Map of questions from the controller
        Map<String, dynamic> questionsMap = _controller.GetTopicQuestion.value;

        // Convert Map values to a list of questions
        List questions = List.from(questionsMap.values.toList())..removeLast();

        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentQuestionIndex = index;
                    selectedIndex = -1;
                    correctIndex = -1;
                    showAdditonalText = false; // Reset additional text visibility
                  });
                },
                itemBuilder: (context, index) {
                  var question = questions[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Html(
                                shrinkWrap: true,
                                data: question['question'] ?? '',
                                style: {
                                  "p": Style(
                                    width: Width(400),
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize(16),
                                    lineHeight: const LineHeight(1.5),
                                    margin: Margins.only(bottom: 16, right: 10),
                                    padding: HtmlPaddings.symmetric(horizontal: 10),
                                  ),
                                  "img": Style(
                                    width: Width(Get.width / 1.11, Unit.px),
                                    height: Height(200, Unit.px),
                                  ),
                                },
                              ),
                              SizedBox(
                                width: Get.width / 1.11,
                                child: createListOfOptions(
                                  context,
                                  [question['option_1'] ?? "", question['option_2'] ?? "", question['option_3'] ?? "", question['option_4'] ?? ""],
                                  question['correct_option'] ?? "E",
                                ),
                              ),
                              SizedBox(height: 10),
                              if (showAdditonalText ?? false) buildAdditonalText(context, question['additional_text'] ?? "")
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: Get.width,
                          child: commonButton(
                            title: currentQuestionIndex == questions.length - 1 ? "Finish" : "Continue",
                            onTapp: () {
                              if (currentQuestionIndex < questions.length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Get.back();

                                // Handle the final page or result
                                print("All questions completed!");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget createListOfOptions(BuildContext context, List<String> optionList, String correctAns) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: optionList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              showAdditonalText = true;
              selectedIndex = index;
              correctIndex = correctAnswer(correctAns);
            });
          },
          child: buildQuestion(context, optionList[index], index),
        );
      },
    );
  }

  int correctAnswer(String correctOption) {
    switch (correctOption) {
      case "A":
        return 0;
      case "B":
        return 1;
      case "C":
        return 2;
      case "D":
        return 3;
      default:
        throw ArgumentError("Invalid option: $correctOption");
    }
  }

  Widget buildQuestion(BuildContext context, String text, int index) {
    Color backgroundColor;

    if (selectedIndex == index) {
      if (index == correctIndex) {
        backgroundColor = primary2; // Correct answer selected
      } else {
        backgroundColor = Colors.red; // Incorrect answer selected
      }
    } else if (index == correctIndex) {
      backgroundColor = primary2; // Correct answer, but not selected
    } else {
      backgroundColor = Colors.grey.shade200; // Default color
    }

    return Container(
      width: Get.width / 1.11,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "urbani_extrabold",
          ),
        ),
      ),
    );
  }

  Widget buildAdditonalText(BuildContext context, String text) {
    return Container(
      width: Get.width / 1.11,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          children: [
            Icon(
              Icons.info_outline,
              color: primary2,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "urbani_extrabold",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
