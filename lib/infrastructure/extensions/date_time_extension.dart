extension DateTimeExtension on DateTime {
  String getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);
    final seconds = difference.inSeconds;
    switch (seconds) {
      case < 60:
        return 'just now';
      case < 60 * 60:
        final minutes = difference.inMinutes;
        return '$minutes minutes ago';
      case < 60 * 60 * 24:
        final hours = difference.inHours;
        return '$hours hours ago';
      case < 60 * 60 * 24 * 7:
        final days = difference.inDays;
        return '$days days ago';
      case < 60 * 60 * 24 * 7 * 4:
        final weeks = difference.inDays ~/ 7;
        return '$weeks weeks ago';
      case < 60 * 60 * 24 * 7 * 4 * 12:
        final months = difference.inDays ~/ 30;
        return '$months months ago';
      case < 60 * 60 * 24 * 7 * 4 * 12 * 100:
        final years = difference.inDays ~/ 365;
        return '$years years ago';
      default:
        return "${year.toString().padLeft(4, '0')}-"
            "${month.toString().padLeft(2, '0')}-"
            "${day.toString().padLeft(2, '0')}";
    }
  }
}
