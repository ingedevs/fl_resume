import 'package:fl_resume/app/domain/resume.dart';
import 'package:fl_resume/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    required this.project,
    super.key,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.project.url != null
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => isHover = true),
                      onExit: (_) => setState(() => isHover = false),
                      child: GestureDetector(
                        onTap: () {
                          if (widget.project.url != null) {
                            launchUrlString(widget.project.url!);
                          }
                        },
                        child: Text(
                          widget.project.name,
                          style: style.titleMedium?.copyWith(
                            decoration:
                                isHover ? TextDecoration.underline : null,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      widget.project.name,
                      style: style.titleMedium,
                    ),
              if (widget.project.isActive ?? false) ...[
                const SizedBox(width: 6),
                const Icon(RemixIcon.circle, size: 6, color: Colors.green),
              ],
              if (widget.project.github != null) ...[
                const SizedBox(width: defaultPadding / 2),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchUrlString(widget.project.github!),
                    child: const Icon(RemixIcon.github, size: 20),
                  ),
                ),
              ],
            ],
          ),
          Text(widget.project.description,
              maxLines: 3,
              style: style.bodyMedium?.copyWith(
                color: Colors.black.withOpacity(.7),
                letterSpacing: 0.5,
                wordSpacing: 1,
              )),
          const Spacer(),
          ...widget.project.highlights.map((e) => Container(
                margin: const EdgeInsets.only(top: defaultPadding / 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Text(e,
                    style: style.bodySmall?.copyWith(
                      color: Colors.black.withOpacity(.7),
                      letterSpacing: 0.5,
                      wordSpacing: 1,
                    )),
              )),
        ],
      ),
    );
  }
}
