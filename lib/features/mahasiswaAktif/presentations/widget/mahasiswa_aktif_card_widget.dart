import 'package:flutter/material.dart';
import '../../models/mahasiswa_aktif_model.dart';
 
class MahasiswaAktifCardWidget extends StatelessWidget {
  final MahasiswaAktifModel mahasiswaAktif;
  final VoidCallback? onTap;
 
  const MahasiswaAktifCardWidget({
    Key? key,
    required this.mahasiswaAktif,
    this.onTap,
  }) : super(key: key);

  String _getInitials(String title) {
    final words = title.split(' ');
    if (words.isEmpty) return '?';
    return words[0][0].toUpperCase();
  }

  Color _getAvatarColor(String title) {
    final colors = [
      const Color(0xFF7C3AED),
      const Color(0xFF3B82F6),
      const Color(0xFF06B6D4),
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
    ];
    return colors[title.hashCode % colors.length];
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getAvatarColor(mahasiswaAktif.title).withOpacity(0.15),
            _getAvatarColor(mahasiswaAktif.title).withOpacity(0.05),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _getAvatarColor(mahasiswaAktif.title).withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getAvatarColor(mahasiswaAktif.title),
                      _getAvatarColor(mahasiswaAktif.title).withOpacity(0.7),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _getAvatarColor(mahasiswaAktif.title).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _getInitials(mahasiswaAktif.title),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mahasiswaAktif.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    
                    // User ID
                    Row(
                      children: [
                        Icon(
                          Icons.badge,
                          size: 12,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'User ID: ${mahasiswaAktif.userId}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    
                    // Body
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          size: 12,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            mahasiswaAktif.body,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
                size: 24,
              ),
            ],
          ),
        ),
          ),
        ),
      );
  }
}