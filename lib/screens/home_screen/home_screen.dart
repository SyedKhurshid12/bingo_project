import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildTitle("Bkrkortsteori"),
              const SizedBox(height: 10),
              _buildHighlightedContainer(
                imagePath: "assets/images/theory.png",
                title: "Theory",
                description: "Master driving rules, ace your test",
              ),
              const SizedBox(height: 10),
              _buildCard(
                context,
                title: "Mandatory Courses",
                description: "Essential lessons for driving success.",
                subDescription: "Viktiga lärdomar för att driva framgång.",
                child: _buildGrid(context),
              ),
              const SizedBox(height: 10),
              _buildCard(
                context,
                title: "Learning Progress",
                description: "Weekly Report, 12 December - 18 December",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Weekly Progress",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildProgressBar(context, [0.45, 0.25, 0.30]),
                    const SizedBox(height: 10),
                    const Text(
                      "Average Progress",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildProgressBarWithoutPercentage(
                        context, [0.45, 0.25, 0.30]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 34,
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildHighlightedContainer({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    String? description,
    String? subDescription,
    required Widget child,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 2),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
          if (subDescription != null) ...[
            const SizedBox(height: 2),
            Text(
              subDescription,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final categories = [
      "Introduction Course",
      "Risk Training 1",
      "Risk Training 2",
      "Theory & Driving Test",
    ];
    final imageList = [
      "assets/images/introduction.png",
      "assets/images/vlc.png",
      "assets/images/risk_training.png",
      "assets/images/training_test.png",
    ];
    final boxColor = [
      const Color(0xffFEF2D3),
      const Color(0xffD3FED7),
      const Color(0xffD3E3FE),
      const Color(0xffFED3D4),
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: boxColor[index],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageList[index],
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  categories[index],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressBar(BuildContext context, List<double> percentages) {
    final colors = [
      const Color(0xff46DEAF),
      const Color(0xffFFCE6E),
      const Color(0xffEEEEEE),
    ];

    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: percentages.asMap().entries.map((entry) {
          final index = entry.key;
          final percentage = entry.value;
          return Container(
            width: (MediaQuery.of(context).size.width - 48) * percentage,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  : index == percentages.length - 1
                      ? const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      : null,
            ),
            alignment: Alignment.center,
            child: Text(
              "${(percentage * 100).round()}%",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProgressBarWithoutPercentage(
      BuildContext context, List<double> percentages) {
    final colors = [
      const Color(0xff46DEAF),
      const Color(0xffFFCE6E),
      const Color(0xffEEEEEE),
    ];

    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: percentages.asMap().entries.map((entry) {
          final index = entry.key;
          final percentage = entry.value;
          return Container(
            width: (MediaQuery.of(context).size.width - 48) * percentage,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  : index == percentages.length - 1
                      ? const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}
