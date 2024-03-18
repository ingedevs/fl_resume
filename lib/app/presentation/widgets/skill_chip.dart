import 'package:fl_resume/app/domain/resume.dart';
import 'package:fl_resume/config/constants.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;

  const SkillChip({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding / 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Text(skill.name,
          style: style.bodySmall?.copyWith(
            color: Colors.black,
            letterSpacing: 0.5,
            wordSpacing: 1,
          )),
    );
  }
}
