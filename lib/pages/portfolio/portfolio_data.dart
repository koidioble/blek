import 'package:flutter/material.dart';
import 'portfolio_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PORTFOLIO DATA MODELS
// ─────────────────────────────────────────────────────────────────────────────

class SkillData {
  final String title;
  final String subtitle;
  final IconData icon;
  final SkillColor color;
  final List<String> tags;
  final String tier;

  const SkillData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.tags,
    required this.tier,
  });
}

class ProjectData {
  final String name;
  final String? logoAsset;
  final String description;
  final String? githubUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? webUrl;
  final String? status;
  final String? detailDescription;
  final IconData icon;
  final ProjectColor color;
  final List<String> badges;
  final List<String> stack;
  final List<String>? highlights;

  const ProjectData({
    required this.name,
    required this.description,
    this.logoAsset,
    this.githubUrl,
    this.appStoreUrl,
    this.playStoreUrl,
    this.webUrl,
    this.status,
    this.detailDescription,
    required this.icon,
    required this.color,
    required this.badges,
    required this.stack,
    this.highlights,
  });
}

class TimelineEntry {
  final String period;
  final String title;
  final String subtitle;
  final IconData icon;
  final SkillColor colorToken;

  const TimelineEntry({
    required this.period,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colorToken,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// SKILLS
// ─────────────────────────────────────────────────────────────────────────────

final List<SkillData> portfolioSkills = [
  const SkillData(
    title: 'Mobile Application Development',
    subtitle: 'Flutter and Dart applications across iOS, Android, and web',
    icon: Icons.smartphone_rounded,
    color: SkillColor.electricViolet,
    tags: [
      'Flutter',
      'Dart',
      'Object-Oriented Programming',
      'Material 3',
      'State Management',
      'Responsive UI',
      'iOS',
      'Android',
      'Web',
      'App Store Connect',
      'Play Console',
      'Xcode',
      'Android Studio',
    ],
    tier: 'Primary Stack',
  ),
  const SkillData(
    title: 'Web Application Development',
    subtitle: 'Interactive web applications with modern JavaScript frameworks',
    icon: Icons.code_rounded,
    color: SkillColor.aquaMarine,
    tags: [
      'React',
      'Next.js',
      'TypeScript',
      'JavaScript',
      'HTML',
      'CSS',
      'REST APIs',
      'JSON',
      'Responsive Design',
      'Vercel',
      'Firebase Hosting',
    ],
    tier: 'Applied Experience',
  ),
  const SkillData(
    title: 'Backend and Cloud Services',
    subtitle:
        'Authentication, real-time data, storage, and serverless integrations',
    icon: Icons.cloud_done_rounded,
    color: SkillColor.amber,
    tags: [
      'Firebase Authentication',
      'Cloud Firestore',
      'Firebase Storage',
      'Firebase Cloud Messaging',
      'Firebase Hosting',
      'Cloud Functions',
      'Supabase Auth',
      'Supabase Realtime',
      'Supabase Storage',
      'REST API Integration',
    ],
    tier: 'Applied Experience',
  ),
  const SkillData(
    title: 'Databases and Security',
    subtitle: 'Database-backed workflows, data modeling, and access controls',
    icon: Icons.storage_rounded,
    color: SkillColor.lightsalmon,
    tags: [
      'PostgreSQL',
      'Supabase',
      'Cloud Firestore',
      'SQLite',
      'MySQL',
      'Data Modeling',
      'SQL Fundamentals',
      'Row-Level Security',
      'Firebase Security Rules',
      'Authentication',
    ],
    tier: 'Applied Experience',
  ),
  const SkillData(
    title: 'Cloud and Deployment',
    subtitle:
        'Hosting, cloud infrastructure fundamentals, and release workflows',
    icon: Icons.rocket_launch_rounded,
    color: SkillColor.blue,
    tags: [
      'AWS Fundamentals',
      'VPC',
      'Subnets',
      'Elastic IP',
      'Firebase Hosting',
      'Vercel',
      'GitHub Actions',
      'CI/CD Fundamentals',
      'Docker Fundamentals',
      'Release Builds',
    ],
    tier: 'Working Knowledge',
  ),
  const SkillData(
    title: 'Engineering Practices',
    subtitle: 'Building maintainable software and improving delivery quality',
    icon: Icons.rule_rounded,
    color: SkillColor.seafoamGreen,
    tags: [
      'Git',
      'GitHub',
      'Debugging',
      'Error Handling',
      'Code Reviews',
      'Documentation',
      'Testing Fundamentals',
      'Accessibility',
      'Localization',
      'Agile / Scrum',
    ],
    tier: 'Applied Experience',
  ),
  const SkillData(
    title: 'Automation and Data Tools',
    subtitle: 'Scripting, field-data workflows, and development tooling',
    icon: Icons.terminal_rounded,
    color: SkillColor.coral,
    tags: [
      'Python',
      'PowerShell',
      'Data Analytics',
      'Automation',
      'KoboToolbox',
      'ODK',
      'XLSForm',
      'Power BI',
      'npm',
      'pub.dev',
    ],
    tier: 'Applied Experience',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// PROJECTS
// ─────────────────────────────────────────────────────────────────────────────

final List<ProjectData> portfolioProjects = [
  const ProjectData(
    name: 'Ma Cacaoyère',
    logoAsset: 'assets/portfolio/ma_cacaoyere_cover.webp',
    description:
        'A field-data collection system for cacao producers: a Flutter mobile app '
        'for agents and a TypeScript admin dashboard for coordinators, backed by '
        'Supabase authentication, PostgreSQL data, storage, and real-time updates.',
    icon: Icons.agriculture_rounded,
    color: ProjectColor.forestGreen,
    badges: ['Flutter', 'Supabase', 'AgriTech', 'Admin'],
    stack: [
      "PostgreSQL",
      "Cloud Firestore",
      "Supabase Realtime",
      "Supabase Auth",
      "Supabase Storage",
      'Supabase Hosting',
      'Firebase Hosting',
    ],
    webUrl: 'https://ma-cacaoyere.web.app',
    status: 'Live',
    detailDescription:
        'Ma Cacaoyère supports cacao-producer field operations for my intern development work. '
        'I built a Flutter mobile workflow for agents to capture producer and survey data, '
        'alongside a TypeScript web dashboard for coordinators to review, organize, and '
        'manage field information. The system uses Supabase Auth, PostgreSQL, Storage, '
        'and Realtime for backend workflows, with the dashboard deployed through Firebase Hosting.',
    highlights: [
      'Built a Flutter field application for producer and survey data collection',
      'Built a TypeScript-based dashboard for data review and operational coordination',
      'Used Supabase Auth, PostgreSQL, Storage, and Realtime for backend workflows',
      'Designed data capture around KoboToolbox, ODK, and XLSForm field processes',
      'Deployed the dashboard through Firebase Hosting',
      'Distributed Android APK builds for field testing',
    ],
  ),

  const ProjectData(
    name: 'Nkommo',
    logoAsset: 'assets/portfolio/nkommo_cover.webp',
    description:
        'A quiet, focused space to share real experiences, explore cultures, and learn together — '
        'live on the App Store.',
    icon: Icons.forum_rounded,
    color: ProjectColor.cornsilk,
    badges: ['Flutter', 'iOS', 'Social', 'Diaspora'],
    stack: [
      'Flutter',
      'Dart',
      'Xcode',
      'Visual Studio Code',
      'Swift',
      'iOS',
      'Objective-C',
      'C/C++',
      'BLoC',
      'Firebase Auth',
      'Cloud Firestore',
      'Firebase Notifications',
      'Apple Sign-In',
      'Google Sign-In',
      'Material 3',
      'App Store Connect',
      'Supabase',
    ],
    webUrl:
        'https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://apps.apple.com/us/app/nkommo/id6759795970&ved=2ahUKEwjoq9CWqOuWAxUP4MkDHb5INIcQFnoECBkQAQ&usg=AOvVaw0Orl5NGnrHnQ6nrSnO-bzO',
    status: 'Live on App Store',
    detailDescription:
        'A Flutter social and community application for sharing diaspora stories '
        'and conversations, using Firebase Authentication, Cloud Firestore, '
        'push notifications, and BLoC-based state management. Released on the '
        'Apple App Store.',
    highlights: [
      'Released on the Apple App Store; Android release in development',
      'Built a Flutter client using BLoC to separate UI, state, and business logic',
      'Implemented user authentication with Google and Apple sign-in',
      'Designed Cloud Firestore-backed conversations, comments, likes, and repost workflows',
      'Integrated Firebase Cloud Messaging and local notifications',
      'Implemented dark/light themes, settings, sharing, and localization support',
      'Handled external links and REST API integrations where needed',
    ],
  ),

  const ProjectData(
    name: 'Sii-Kaa',
    logoAsset: 'assets/portfolio/siikaa_ai_cover.webp',
    description:
        'A Flutter currency analytics application that presents API-driven '
        'exchange-rate data for more than 170 currencies, with search, '
        'visualization, preferences, and Firebase-backed application services.',
    icon: Icons.monetization_on_rounded,
    color: ProjectColor.canaryYellow,
    badges: ['Flutter', 'Firebase', 'FinTech', 'Global'],
    stack: [
      'Flutter',
      'Dart',
      'REST API',
      'HTTP',
      'BLoC',
      'Provider',
      'FL Chart',
      'SharedPreferences',
      'Responsive Web',
      'Firebase Auth',
      'Firebase Analytics',
      'Cloud Firestore',
      'Firebase Hosting',
    ],
    webUrl: 'https://www.sii-kaa.com',
    status: 'Live',
    detailDescription:
        'Sii-Kaa is a cross-platform currency analytics platform built for the global financial'
        'market and the diaspora. Tracks over 170 world currencies in real time, '
        'with a focus on global exchange rates underserved by mainstream financial tools.',
    highlights: [
      'Displays exchange-rate data for 170+ global currencies',
      'Integrated an external exchange-rate API using typed HTTP workflows',
      'Built chart-based currency visualizations with FL Chart',
      'Used Provider/BLoC patterns for predictable application state',
      'Persisted user preferences with SharedPreferences',
      'Integrated Firebase Authentication, Analytics, Firestore, and Hosting',
      'Designed responsive Flutter views for web and mobile',
    ],
  ),

  const ProjectData(
    name: 'Babylon AI',
    logoAsset: 'assets/portfolio/babylon_ai_cover.webp',
    description:
        'A bilingual JavaScript-learning platform built with Next.js, React, and '
        'TypeScript, featuring sequential lesson progression, browser-based '
        'progress persistence, syntax-highlighted examples, and Vercel deployment.',
    icon: Icons.school_rounded,
    color: ProjectColor.purple,
    badges: ['React', 'Next.js', 'TypeScript', 'EdTech', 'Vercel'],
    stack: [
      'Next.js 15',
      'React 19',
      'TypeScript',
      'Tailwind CSS v4',
      'Framer Motion',
      'Prism',
      'Vercel',
    ],
    webUrl: 'https://babylon-ai.vercel.app',
    status: 'Live',
    detailDescription:
        'Babylon AI is an interactive coding education platform designed to teach '
        'JavaScript fundamentals through structured, progressive lessons. Users unlock '
        'lessons sequentially as they complete each module, with progress persisted '
        'locally across sessions.\n\n'
        'Built with Next.js 15 App Router and React 19, featuring bilingual support '
        '(English / French), Framer Motion animations, and syntax-highlighted code '
        'examples via Prism. Deployed on Vercel.',
    highlights: [
      'Structured lesson data and reusable React components for maintainability',
      '39 structured JavaScript lessons — unlock progressively',
      'Bilingual interface — English and French',
      'Progress persisted locally via localStorage',
      'Syntax-highlighted code examples with Prism',
      'Framer Motion animations for smooth UX',
      'Built with Next.js 15 App Router + React 19',
      'Deployed on Vercel',
    ],
  ),

  const ProjectData(
    name: 'Harmattan',
    logoAsset: 'assets/portfolio/harmattan_cover.webp',
    githubUrl: 'https://github.com/koidioble/harmattan',
    description:
        'A multilingual educational web experience about the Harmattan wind, built '
        'with semantic HTML and modern CSS. It demonstrates responsive layout, '
        'accessibility-minded content structure, and CSS-only theming and interactions.',
    icon: Icons.air_rounded,
    color: ProjectColor.amber,
    badges: ['HTML', 'CSS', 'No-JS', 'i18n'],
    stack: [
      'HTML5',
      'CSS3',
      'Semantic HTML',
      'Responsive Design',
      'CSS Grid',
      'Flexbox',
      'i18n',
      ':has()',
      ':target',
      'GitHub Pages',
    ],
    webUrl: 'https://koidioble.github.io/harmattan/',
    status: 'Live',
    detailDescription:
        'Harmattan pairs two things in one project: a factually-researched '
        'explainer on the real Harmattan wind — its formation, and its impact '
        'on health, aviation, agriculture, and the regions it crosses — and a '
        'UI-patterns playground demonstrating what pure CSS can still do '
        'without a framework. Every fact is sourced and cited; every '
        'interactive pattern (theme switch, language switch, modal, animated '
        'chart) runs on CSS alone, no JavaScript anywhere.',
    highlights: [
      'Zero JavaScript — theme toggle, sign-in modal, and language switch all run on pure CSS',
      'Full EN / FR / ES translation across every page, including the header controls',
      'CSS-only interactivity via :has() and :target selectors',
      'Self-synthesized ambient audio embed — no copyright risk',
      'Real multi-page site with semantic HTML, data tables, and cross-page navigation',
      'Every factual claim sourced and linked in the project README',
    ],
  ),

  const ProjectData(
    name: 'Salon Booking App',
    logoAsset: 'assets/portfolio/salon_booking_cover.webp',
    description:
        'Cross-platform salon appointment booking system with real-time '
        'availability, client management, and a full Firebase backend.',
    icon: Icons.content_cut_rounded,
    color: ProjectColor.coral,
    badges: ['Flutter', 'Firebase', 'Booking', 'PWA'],
    stack: [
      'Flutter',
      'Dart',
      'Firebase Auth',
      'Cloud Firestore',
      'Real-Time Updates',
      'Firebase Hosting',
      'Responsive Web',
      'Booking Workflows',
    ],
    webUrl: 'https://salon-booking-app-003.web.app',
    status: 'Live',
    detailDescription:
        'A full-featured salon appointment booking platform built cross-platform with '
        'Flutter. Clients browse availability, book appointments, and manage bookings '
        'in real time. Backend runs entirely on Firebase — Firestore for data, '
        'Authentication for user accounts, Hosting for deployment.',
    highlights: [
      'Real-time appointment booking and availability',
      'Firebase Authentication — secure user accounts',
      'Cloud Firestore — live data sync',
      'Cross-platform: web and mobile from one codebase',
      'Firebase Hosting — zero-config deployment',
    ],
  ),

  // const ProjectData(
  //   name: 'Digba Gym',
  //   logoAsset: 'assets/portfolio/digba_gym_cover.webp',
  //   description:
  //       'Fitness and gym management app built with Flutter — member tracking, '
  //       'session scheduling, and workout planning on web and mobile.',
  //   icon: Icons.fitness_center_rounded,
  //   color: ProjectColor.teal,
  //   badges: ['Flutter', 'Firebase', 'Fitness', 'PWA'],
  //   stack: [
  //     'Flutter',
  //     'Dart',
  //     'Cloud Firestore',
  //     'Firebase Hosting',
  //     'Member Management',
  //     'Scheduling',
  //     'Workout Planning',
  //     'Responsive Web',
  //   ],
  //   webUrl: 'https://digbagym.web.app',
  //   status: 'Live',
  //   detailDescription:
  //       'Digba Gym is a fitness management application built with Flutter and Firebase. '
  //       'Handles member management, session scheduling, and workout tracking with a '
  //       'clean, performant interface deployable across web and mobile from a single codebase.',
  //   highlights: [
  //     'Member tracking and gym management',
  //     'Session scheduling and workout planning',
  //     'Flutter — single codebase, web and mobile',
  //     'Cloud Firestore real-time backend',
  //     'Firebase Hosting deployment',
  //   ],
  // ),
];
