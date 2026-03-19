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

  String _getInitials(String name) {
    final names = name.split(' ');
    if (names.isEmpty) return '?';
    return names[0][0].toUpperCase();
  }

  Color _getAvatarColor(String name) {
    final colors = [
      const Color(0xFF7C3AED),
      const Color(0xFF3B82F6),
      const Color(0xFF06B6D4),
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
    ];
    return colors[name.hashCode % colors.length];
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
            _getAvatarColor(mahasiswa.name).withOpacity(0.15),
            _getAvatarColor(mahasiswa.name).withOpacity(0.05),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _getAvatarColor(mahasiswa.name).withOpacity(0.1),
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
                      _getAvatarColor(mahasiswa.name),
                      _getAvatarColor(mahasiswa.name).withOpacity(0.7),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _getAvatarColor(mahasiswa.name).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _getInitials(mahasiswa.name),
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
                      mahasiswa.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    
                    // ID
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
                            'ID: ${mahasiswa.id}',
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
                    
                    // Email
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 12,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            mahasiswa.email,
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