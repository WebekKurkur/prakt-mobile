import 'package:flutter/material.dart';
import '../../models/mahasiswa_model.dart';

class MahasiswaCardWidget extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  final VoidCallback? onTap;

  const MahasiswaCardWidget({
    Key? key,
    required this.mahasiswa,
    this.onTap,
  }) : super(key: key);

  Color _getAvatarColor(int colorIndex) {
    final colors = [
      const Color(0xFF7C5FD4), // Purple
      const Color(0xFFF0537E), // Pink
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF4CAF50), // Green
    ];
    return colors[colorIndex % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _getAvatarColor(mahasiswa.colorIndex).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: _getAvatarColor(mahasiswa.colorIndex),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  mahasiswa.initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mahasiswa.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.badge, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'NIM: ${mahasiswa.nim}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          mahasiswa.email,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.school, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Semeter: ${mahasiswa.semester}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
