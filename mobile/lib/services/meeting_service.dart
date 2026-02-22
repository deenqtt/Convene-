import '../core/api_client.dart';
import '../models/meeting.dart';

class MeetingService {
  static Future<TodayDashboard> getToday() async {
    final res = await ApiClient.get('/api/meetings/today');
    return TodayDashboard.fromJson(res['data'] as Map<String, dynamic>);
  }

  static Future<List<Meeting>> getUpcoming({int days = 7, int limit = 10}) async {
    final res = await ApiClient.get('/api/meetings/upcoming?days=$days&limit=$limit');
    return (res['data'] as List<dynamic>)
        .map((m) => Meeting.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  static Future<List<Meeting>> list({String? status, String? date, String? search}) async {
    final params = <String, String>{};
    if (status != null) params['status'] = status;
    if (date != null) params['date'] = date;
    if (search != null) params['search'] = search;
    final query = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    final res = await ApiClient.get('/api/meetings${query.isNotEmpty ? '?$query' : ''}');
    return (res['data'] as List<dynamic>)
        .map((m) => Meeting.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  static Future<Meeting> create({
    required String title,
    required String type,
    required String date,
    required String startTime,
    required String endTime,
    String? meetingLink,
    String? location,
    String? agenda,
    bool isRecurring = false,
    List<String> participantIds = const [],
  }) async {
    final res = await ApiClient.post('/api/meetings', {
      'title': title,
      'type': type,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      if (meetingLink != null) 'meetingLink': meetingLink,
      if (location != null) 'location': location,
      if (agenda != null) 'agenda': agenda,
      'isRecurring': isRecurring,
      'participantIds': participantIds,
    });
    return Meeting.fromJson(res['data'] as Map<String, dynamic>);
  }

  static Future<void> cancel(String id) async {
    await ApiClient.delete('/api/meetings/$id');
  }
}
