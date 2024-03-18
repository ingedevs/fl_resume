import 'package:fl_resume/app/data/home_provider.dart';
import 'package:fl_resume/app/domain/resume.dart';
import 'package:fl_resume/app/presentation/widgets/education_card.dart';
import 'package:fl_resume/app/presentation/widgets/profile_box.dart';
import 'package:fl_resume/app/presentation/widgets/project_card.dart';
import 'package:fl_resume/app/presentation/widgets/skill_chip.dart';
import 'package:fl_resume/app/presentation/widgets/work_experience_card.dart';
import 'package:fl_resume/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Resume> resume = ref.watch(homeProvider);

    return Scaffold(
      body: resume.when(
        data: (data) => _BodyBuilder(resume: data),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class _BodyBuilder extends StatelessWidget {
  final Resume resume;

  const _BodyBuilder({
    required this.resume,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(basics: resume.basics),
                _AboutMe(summary: resume.basics.summary),
                _WorkExperience(works: resume.work),
                _Education(education: resume.education),
                _Projects(projects: resume.projects),
                _Skills(skills: resume.skills),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------

class _Skills extends StatelessWidget {
  final List<Skill> skills;

  const _Skills({
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    if (skills.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Habilidades',
                style: style.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                )),
          ),
          Wrap(
            spacing: defaultPadding / 2,
            runSpacing: defaultPadding / 2,
            children: skills.map((e) => SkillChip(skill: e)).toList(),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------

class _Projects extends StatelessWidget {
  final List<Project> projects;

  const _Projects({
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    if (projects.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Proyectos',
                style: style.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 1.5,
              mainAxisExtent: 200,
            ),
            itemCount: projects.length,
            itemBuilder: (_, i) {
              final project = projects[i];
              return ProjectCard(project: project);
            },
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------

class _Education extends StatelessWidget {
  final List<Education> education;

  const _Education({
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    if (education.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Educación',
                style: style.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                )),
          ),
          ...education.map((e) => EducationCard(education: e)),
        ],
      ),
    );
  }
}

// ------------------------------------------------

class _WorkExperience extends StatelessWidget {
  final List<Volunteer> works;

  const _WorkExperience({
    required this.works,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    if (works.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Experiencia laboral',
                style: style.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                )),
          ),
          ...works.map((e) => WorkExperienceCard(work: e)),
        ],
      ),
    );
  }
}

// ------------------------------------------------

class _AboutMe extends StatelessWidget {
  final String summary;

  const _AboutMe({
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2),
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Sobre mí',
                style: style.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                )),
          ),
          Text(summary,
              style: style.bodyLarge?.copyWith(
                color: Colors.black.withOpacity(.7),
                letterSpacing: 0.5,
                wordSpacing: 1,
              )),
        ],
      ),
    );
  }
}

// ------------------------------------------------

class _Header extends StatelessWidget {
  final Basics basics;

  const _Header({
    required this.basics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding * 2,
        bottom: defaultPadding * 2,
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                  child: Text(basics.name,
                      style: style.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text(basics.label, style: style.bodyLarge),
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(RemixIcon.global_outline,
                          size: 14, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text(
                        '${basics.location.city}, ${basics.location.region}',
                        style: style.bodySmall?.copyWith(
                          color: Colors.black.withOpacity(.7),
                          letterSpacing: 0.5,
                          wordSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: defaultPadding / 2),
                    itemCount: basics.profiles.length,
                    itemBuilder: (_, i) {
                      final profile = basics.profiles[i];
                      return ProfileBox(profile: profile);
                    },
                  ),
                ),
              ],
            ),
          ),
          AdvancedAvatar(
            size: 100,
            image: NetworkImage(basics.image),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
        ],
      ),
    );
  }
}
