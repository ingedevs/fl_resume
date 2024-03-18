import 'dart:convert';

class Resume {
  final Basics basics;
  final List<Volunteer> work;
  final List<Volunteer> volunteer;
  final List<Education> education;
  final List<Award> awards;
  final List<Certificate> certificates;
  final List<Publication> publications;
  final List<Skill> skills;
  final List<Language> languages;
  final List<Interest> interests;
  final List<Reference> references;
  final List<Project> projects;

  Resume({
    required this.basics,
    required this.work,
    required this.volunteer,
    required this.education,
    required this.awards,
    required this.certificates,
    required this.publications,
    required this.skills,
    required this.languages,
    required this.interests,
    required this.references,
    required this.projects,
  });

  factory Resume.fromRawJson(String str) => Resume.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        basics: Basics.fromJson(json['basics']),
        work: List<Volunteer>.from(
            json['work'].map((x) => Volunteer.fromJson(x))),
        volunteer: List<Volunteer>.from(
            json['volunteer'].map((x) => Volunteer.fromJson(x))),
        education: List<Education>.from(
            json['education'].map((x) => Education.fromJson(x))),
        awards: List<Award>.from(json['awards'].map((x) => Award.fromJson(x))),
        certificates: List<Certificate>.from(
            json['certificates'].map((x) => Certificate.fromJson(x))),
        publications: List<Publication>.from(
            json['publications'].map((x) => Publication.fromJson(x))),
        skills: List<Skill>.from(json['skills'].map((x) => Skill.fromJson(x))),
        languages: List<Language>.from(
            json['languages'].map((x) => Language.fromJson(x))),
        interests: List<Interest>.from(
            json['interests'].map((x) => Interest.fromJson(x))),
        references: List<Reference>.from(
            json['references'].map((x) => Reference.fromJson(x))),
        projects: List<Project>.from(
            json['projects'].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'basics': basics.toJson(),
        'work': List<dynamic>.from(work.map((x) => x.toJson())),
        'volunteer': List<dynamic>.from(volunteer.map((x) => x.toJson())),
        'education': List<dynamic>.from(education.map((x) => x.toJson())),
        'awards': List<dynamic>.from(awards.map((x) => x.toJson())),
        'certificates': List<dynamic>.from(certificates.map((x) => x.toJson())),
        'publications': List<dynamic>.from(publications.map((x) => x.toJson())),
        'skills': List<dynamic>.from(skills.map((x) => x.toJson())),
        'languages': List<dynamic>.from(languages.map((x) => x.toJson())),
        'interests': List<dynamic>.from(interests.map((x) => x.toJson())),
        'references': List<dynamic>.from(references.map((x) => x.toJson())),
        'projects': List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Award {
  final String title;
  final DateTime date;
  final String awarder;
  final String summary;

  Award({
    required this.title,
    required this.date,
    required this.awarder,
    required this.summary,
  });

  factory Award.fromRawJson(String str) => Award.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Award.fromJson(Map<String, dynamic> json) => Award(
        title: json['title'],
        date: DateTime.parse(json['date']),
        awarder: json['awarder'],
        summary: json['summary'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'awarder': awarder,
        'summary': summary,
      };
}

class Basics {
  final String name;
  final String label;
  final String image;
  final String email;
  final String phone;
  final String url;
  final String summary;
  final Location location;
  final List<Profile> profiles;

  Basics({
    required this.name,
    required this.label,
    required this.image,
    required this.email,
    required this.phone,
    required this.url,
    required this.summary,
    required this.location,
    required this.profiles,
  });

  factory Basics.fromRawJson(String str) => Basics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Basics.fromJson(Map<String, dynamic> json) => Basics(
        name: json['name'],
        label: json['label'],
        image: json['image'],
        email: json['email'],
        phone: json['phone'] ?? '',
        url: json['url'],
        summary: json['summary'],
        location: Location.fromJson(json['location']),
        profiles: List<Profile>.from(
            json['profiles'].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'label': label,
        'image': image,
        'email': email,
        'phone': phone,
        'url': url,
        'summary': summary,
        'location': location.toJson(),
        'profiles': List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Location {
  final String city;
  final String countryCode;
  final String region;

  Location({
    required this.city,
    required this.countryCode,
    required this.region,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json['city'],
        countryCode: json['countryCode'],
        region: json['region'],
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'countryCode': countryCode,
        'region': region,
      };
}

class Profile {
  final String network;
  final String username;
  final String url;

  Profile({
    required this.network,
    required this.username,
    required this.url,
  });

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        network: json['network'],
        username: json['username'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'network': network,
        'username': username,
        'url': url,
      };
}

class Certificate {
  final String name;
  final DateTime date;
  final String issuer;
  final String url;

  Certificate({
    required this.name,
    required this.date,
    required this.issuer,
    required this.url,
  });

  factory Certificate.fromRawJson(String str) =>
      Certificate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        name: json['name'],
        date: DateTime.parse(json['date']),
        issuer: json['issuer'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'issuer': issuer,
        'url': url,
      };
}

class Education {
  final String institution;
  final String area;
  final String studyType;
  final DateTime startDate;
  final DateTime endDate;

  Education({
    required this.institution,
    required this.area,
    required this.studyType,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromRawJson(String str) =>
      Education.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        institution: json['institution'],
        area: json['area'],
        studyType: json['studyType'],
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']),
      );

  Map<String, dynamic> toJson() => {
        'institution': institution,
        'area': area,
        'studyType': studyType,
        'startDate':
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        'endDate':
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}

class Interest {
  final String name;
  final List<String> keywords;

  Interest({
    required this.name,
    required this.keywords,
  });

  factory Interest.fromRawJson(String str) =>
      Interest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        name: json['name'],
        keywords: List<String>.from(json['keywords'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'keywords': List<dynamic>.from(keywords.map((x) => x)),
      };
}

class Language {
  final String language;
  final String fluency;

  Language({
    required this.language,
    required this.fluency,
  });

  factory Language.fromRawJson(String str) =>
      Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json['language'],
        fluency: json['fluency'],
      );

  Map<String, dynamic> toJson() => {
        'language': language,
        'fluency': fluency,
      };
}

class Project {
  final String name;
  final bool? isActive;
  final String description;
  final List<String> highlights;
  final String? url;
  final String? github;

  Project({
    required this.name,
    required this.description,
    required this.highlights,
    required this.url,
    this.isActive,
    this.github,
  });

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json['name'],
        isActive: json['isActive'],
        description: json['description'],
        highlights: List<String>.from(json['highlights'].map((x) => x)),
        url: json['url'],
        github: json['github'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'isActive': isActive,
        'description': description,
        'highlights': List<dynamic>.from(highlights.map((x) => x)),
        'url': url,
        'github': github,
      };
}

class Publication {
  final String name;
  final String publisher;
  final DateTime releaseDate;
  final String url;
  final String summary;

  Publication({
    required this.name,
    required this.publisher,
    required this.releaseDate,
    required this.url,
    required this.summary,
  });

  factory Publication.fromRawJson(String str) =>
      Publication.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        name: json['name'],
        publisher: json['publisher'],
        releaseDate: DateTime.parse(json['releaseDate']),
        url: json['url'],
        summary: json['summary'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'publisher': publisher,
        'releaseDate':
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        'url': url,
        'summary': summary,
      };
}

class Reference {
  final String name;
  final String reference;

  Reference({
    required this.name,
    required this.reference,
  });

  factory Reference.fromRawJson(String str) =>
      Reference.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        name: json['name'],
        reference: json['reference'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'reference': reference,
      };
}

class Skill {
  final String name;
  final Level level;

  Skill({
    required this.name,
    required this.level,
  });

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json['name'],
        level: levelValues.map[json['level']]!,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'level': levelValues.reverse[level],
      };
}

enum Level { avanzado, master }

final levelValues =
    EnumValues({'Avanzado': Level.avanzado, 'Master': Level.master});

class Volunteer {
  final String position;
  final String? url;
  final DateTime startDate;
  final DateTime? endDate;
  final String summary;
  final List<String> highlights;
  final String name;

  Volunteer({
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.summary,
    required this.highlights,
    required this.name,
    this.url,
  });

  factory Volunteer.fromRawJson(String str) =>
      Volunteer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
        position: json['position'],
        url: json['url'],
        startDate: DateTime.parse(json['startDate']),
        endDate:
            json['endDate'] == null ? null : DateTime.parse(json['endDate']),
        summary: json['summary'],
        highlights: List<String>.from(json['highlights'].map((x) => x)),
        name: json['name'] ?? 'no-name',
      );

  Map<String, dynamic> toJson() => {
        'position': position,
        'url': url,
        'startDate':
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        'endDate':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        'summary': summary,
        'highlights': List<dynamic>.from(highlights.map((x) => x)),
        'name': name,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
