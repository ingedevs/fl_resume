import 'package:fl_resume/app/domain/resume.dart';
import 'package:fl_resume/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorkExperienceCard extends StatefulWidget {
  final Volunteer work;

  const WorkExperienceCard({
    required this.work,
    super.key,
  });

  @override
  State<WorkExperienceCard> createState() => _WorkExperienceCardState();
}

class _WorkExperienceCardState extends State<WorkExperienceCard> {
  bool isHover = false;

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
              (widget.work.url != null)
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (_) => setState(() => isHover = true),
                      onExit: (_) => setState(() => isHover = false),
                      child: GestureDetector(
                        onTap: () {
                          if (widget.work.url != null) {
                            launchUrlString(widget.work.url!);
                          }
                        },
                        child: Text(
                          widget.work.name,
                          style: style.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration:
                                isHover ? TextDecoration.underline : null,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      widget.work.name,
                      style: style.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Spacer(),
              Text(
                '${widget.work.startDate.year}  -  ${widget.work.endDate?.year ?? 'Actual'}',
              ),
            ],
          ),
          Text(widget.work.position, style: style.bodyLarge),
          Text(widget.work.summary,
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
