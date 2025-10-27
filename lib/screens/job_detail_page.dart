import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class JobDetailPage extends StatelessWidget {
  final Map<String, dynamic> job;
  const JobDetailPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final requirements = job['requirements'] as List<String>? ?? [];
    
    return Scaffold(
      backgroundColor: AppTheme.primaryBg,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.cardBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.cardBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company icon placeholder
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.business,
                        color: AppTheme.accentGreen,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Job Title
                    Text(
                      job['title'] ?? '',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 26,
                          ),
                    ),
                    const SizedBox(height: 8),

                    // Company Name
                    Text(
                      job['company'] ?? '',
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Applied successfully!'),
                                  backgroundColor: AppTheme.accentGreen,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Apply now',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.cardBg,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.share_outlined,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Tabs (Overview, Jobs, Benefits, Tech stack)
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor: AppTheme.accentGreen,
                            unselectedLabelColor: AppTheme.textSecondary,
                            indicatorColor: AppTheme.accentGreen,
                            indicatorWeight: 3,
                            tabs: const [
                              Tab(text: 'Overview'),
                              Tab(text: 'Jobs'),
                              Tab(text: 'Benefits'),
                              Tab(text: 'Tech stack'),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),

                    // Required Skills & Experience
                    const Text(
                      'Required Skills & Experience',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...requirements.map((req) => Padding(
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
                                  req,
                                  style: const TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 24),

                    // About the company
                    const Text(
                      'About the company',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      job['description'] ?? '',
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Company details
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.business_outlined,
                            title: 'Industry',
                            value: 'Tech Agency',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.location_on_outlined,
                            title: 'Headquarters',
                            value: job['location'] ?? 'Remote',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.people_outline,
                            title: 'Size',
                            value: 'More than 50',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.attach_money,
                            title: 'Salary',
                            value: job['salary'] ?? 'N/A',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Similar remote jobs
                    const Text(
                      'Similar remote jobs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.accentGreen, size: 24),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
