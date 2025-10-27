import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Flutter', 'score': 85, 'category': 'Mobile Development'},
      {'name': 'Dart', 'score': 75, 'category': 'Programming'},
      {'name': 'SQL', 'score': 40, 'category': 'Database'},
      {'name': 'UI/UX Design', 'score': 60, 'category': 'Design'},
      {'name': 'React', 'score': 55, 'category': 'Web Development'},
      {'name': 'Python', 'score': 45, 'category': 'Programming'},
    ];

    final weakSkills = skills.where((s) => (s['score'] as int) < 60).toList();
    final strongSkills =
        skills.where((s) => (s['score'] as int) >= 60).toList();

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.5,
          colors: [
            AppTheme.glowGreen.withOpacity(0.35),
            AppTheme.primaryBg,
            AppTheme.secondaryBg,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CV Analysis',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'AI-powered analysis of your skills and experience',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 24),

              // Overall Score Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.accentGreen,
                      AppTheme.shimmerGreen,
                      AppTheme.glowGreen,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentGreen.withOpacity(0.6),
                      blurRadius: 24,
                      spreadRadius: 4,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Overall Score',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '66%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Good match for senior roles',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Weak Skills Section
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.trending_down,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Skills to Improve',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${weakSkills.length}',
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              ...weakSkills.map((skill) => _buildSkillCard(
                    skill: skill,
                    isWeak: true,
                  )),

              const SizedBox(height: 32),

              // Strong Skills Section
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGreen.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.trending_up,
                      color: AppTheme.accentGreen,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Strong Skills',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGreen.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${strongSkills.length}',
                      style: const TextStyle(
                        color: AppTheme.accentGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              ...strongSkills.map((skill) => _buildSkillCard(
                    skill: skill,
                    isWeak: false,
                  )),

              const SizedBox(height: 24),

              // Recommendations
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardBg.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppTheme.accentGreen,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Recommendations',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildRecommendation(
                        'Take online courses to improve weak skills'),
                    _buildRecommendation(
                        'Add more projects showcasing your strong skills'),
                    _buildRecommendation(
                        'Get certifications in emerging technologies'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard({required Map<String, dynamic> skill, required bool isWeak}) {
    final score = skill['score'] as int;
    final name = skill['name'] as String;
    final category = skill['category'] as String;

    return Container(
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
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isWeak
                      ? Colors.red.withOpacity(0.2)
                      : AppTheme.accentGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$score%',
                  style: TextStyle(
                    color: isWeak ? Colors.redAccent : AppTheme.accentGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 8,
              backgroundColor: AppTheme.primaryBg,
              valueColor: AlwaysStoppedAnimation<Color>(
                isWeak ? Colors.redAccent : AppTheme.accentGreen,
              ),
            ),
          ),
          if (isWeak) ...[
            const SizedBox(height: 8),
            const Text(
              'Recommended to improve for better job matches',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRecommendation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.accentGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
