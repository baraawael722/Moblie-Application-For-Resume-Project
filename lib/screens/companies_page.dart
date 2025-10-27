import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'job_detail_page.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = <Map<String, dynamic>>[
      {
        'company': 'Flexa Tech',
        'title': 'Product Designer',
        'location': 'UAE',
        'salary': '\$85 - 95/hr',
        'time': '40 hrs',
        'type': 'UI/UX',
        'description':
            'The IAPWE or International Association of Professional Writers & Editors is an organization that brings together writers and editors from around the world.',
        'requirements': [
          'At least 3 years of experience in creating data',
          'You must be adept at analyzing requirements and needs',
          'Have prior experience minimum of 2 years on design systems'
        ],
      },
      {
        'company': 'Design Pickle',
        'title': 'Digital Marketer',
        'location': 'UAE',
        'salary': '\$85 - 95/hr',
        'time': '40 hrs',
        'type': 'Marketer',
        'description':
            'Create innovative marketing campaigns and manage digital channels to drive growth.',
        'requirements': [
          'Minimum 2 years of digital marketing experience',
          'Strong knowledge of SEO and SEM',
          'Experience with social media platforms'
        ],
      },
      {
        'company': 'Sezzle',
        'title': 'Product Designer',
        'location': 'UK',
        'salary': '\$85 - 95/hr',
        'time': '40 hrs',
        'type': 'UI/UX',
        'description':
            'Design exceptional user experiences for our fintech platform.',
        'requirements': [
          'Strong portfolio in product design',
          'Experience with Figma and Adobe Creative Suite',
          'Understanding of design systems'
        ],
      },
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.8,
          colors: [
            AppTheme.glowGreen.withOpacity(0.3),
            AppTheme.primaryBg,
            AppTheme.secondaryBg,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'John Nicolas',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.calendar_today_outlined,
                      color: AppTheme.textSecondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            // "Find remote job by AI" Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Find remote job by AI',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),

            // Featured horizontal cards
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: jobs.length,
                itemBuilder: (context, i) {
                  final job = jobs[i];
                  final isFirst = i == 0;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => JobDetailPage(job: job),
                        ),
                      ),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: isFirst
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppTheme.accentGreen,
                                    AppTheme.shimmerGreen,
                                    AppTheme.glowGreen,
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                )
                              : null,
                          color: isFirst ? null : AppTheme.cardBg,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isFirst
                              ? [
                                  BoxShadow(
                                    color: AppTheme.accentGreen.withOpacity(0.5),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 8),
                                  ),
                                ]
                              : null,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: isFirst
                                        ? Colors.black.withOpacity(0.2)
                                        : AppTheme.accentGreen.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.diamond_outlined,
                                        size: 14,
                                        color: isFirst
                                            ? Colors.black
                                            : AppTheme.accentGreen,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        job['type'] as String,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isFirst
                                              ? Colors.black
                                              : AppTheme.accentGreen,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: isFirst
                                      ? Colors.black.withOpacity(0.5)
                                      : AppTheme.textSecondary,
                                  size: 20,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              job['company'] as String,
                              style: TextStyle(
                                color: isFirst
                                    ? Colors.black.withOpacity(0.7)
                                    : AppTheme.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              job['title'] as String,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: isFirst
                                    ? Colors.black
                                    : AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              job['salary'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: isFirst
                                    ? Colors.black
                                    : AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: isFirst
                                      ? Colors.black.withOpacity(0.6)
                                      : AppTheme.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  job['time'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isFirst
                                        ? Colors.black.withOpacity(0.6)
                                        : AppTheme.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: isFirst
                                      ? Colors.black.withOpacity(0.6)
                                      : AppTheme.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  job['location'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isFirst
                                        ? Colors.black.withOpacity(0.6)
                                        : AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // "Get inspired by top talent" Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                'There are ${jobs.length} jobs available',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),

            // Full list below
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: jobs.length,
                itemBuilder: (context, i) {
                  final job = jobs[i];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => JobDetailPage(job: job),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                job['company'] as String,
                                style: const TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: AppTheme.textSecondary,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            job['title'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryBg,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 12,
                                      color: AppTheme.textSecondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      job['time'] as String,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryBg,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: AppTheme.textSecondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      job['location'] as String,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryBg,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Full-time',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                job['salary'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
