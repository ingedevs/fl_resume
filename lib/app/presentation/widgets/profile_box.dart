import 'package:fl_resume/app/domain/resume.dart';
import 'package:flutter/material.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileBox extends StatefulWidget {
  final Profile profile;

  const ProfileBox({
    required this.profile,
    super.key,
  });

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  bool isHover = false;

  IconData getIconProfiles(String network) {
    switch (network) {
      case 'GitHub':
        return RemixIcon.github;
      case 'LinkedIn':
        return RemixIcon.linkedin;
      case 'X':
        return RemixIcon.twitter_x;
      default:
        return RemixIcon.global_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => setState(() {
        isHover = true;
      }),
      onExit: (_) => setState(() {
        isHover = false;
      }),
      child: GestureDetector(
        onTap: () async {
          if (widget.profile.url.isNotEmpty) {
            await launchUrlString(widget.profile.url);
          }
        },
        child: Tooltip(
          message: widget.profile.network,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isHover ? Colors.black12 : Colors.transparent,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              getIconProfiles(widget.profile.network),
              size: 16,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
