import 'package:bingo_project/AppConstData/app_colors.dart';
import 'package:bingo_project/AppConstData/helper_function.dart';
import 'package:flutter/material.dart';

class StepByStepFlow extends StatelessWidget {
  final List<String> steps = [
    'Intro',
    'Key Terms & Basics',
    'Advanced Concepts',
    'Wrap Up',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Step by step',
        showBackIcon: true,
        titleColor: Colors.black,
      ),      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  bool isLeft =
                      index % 2 == 0; // Alternate between left and right
                  return Column(
                    children: [
                      StepWidget(
                        stepNumber: index + 1,
                        label: steps[index],
                        isLeft: isLeft,
                        isLast: index == steps.length - 1,
                      ),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final int stepNumber;
  final String label;
  final bool isLeft;
  final bool isLast;

  const StepWidget({
    Key? key,
    required this.stepNumber,
    required this.label,
    required this.isLeft,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLeft
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primary2),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$stepNumber',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '$label',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Only show image if not the last step
            if (!isLast)
              Image.asset(
                "assets/images/right_line.png",
                height: 50,
                width: 150,
              ),
          ],
        )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Only show image if not the last step
            if (!isLast)
              Image.asset(
                "assets/images/left_line.png",
                height: 50,
                width: 150,
              ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primary2),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$stepNumber',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '$label',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

            ),
          ],
        ),
      ],
    );
  }
}
