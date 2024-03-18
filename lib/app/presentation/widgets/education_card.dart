import 'package:fl_resume/app/domain/resume.dart';
import 'package:fl_resume/config/constants.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final Education education;

  const EducationCard({
    required this.education,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                education.institution,
                style: style.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${education.startDate.year}  -  ${education.endDate.year}',
              ),
            ],
          ),
          Text(education.area,
              style: style.bodyMedium?.copyWith(
                color: Colors.black.withOpacity(.7),
                letterSpacing: 0.5,
                wordSpacing: 1,
              )),
        ],
      ),
    );
  }
}
