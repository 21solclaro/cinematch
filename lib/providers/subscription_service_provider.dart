import 'dart:convert';
import 'package:cinematch/models/subscription_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SubscriptionServiceRepository {
  final List<int> desiredProviderIds = [9, 337, 15, 8, 84];

  Future<List<SubsctiptionService>> fetchProviders() async {
    final uri = Uri.https('api.themoviedb.org', '/3/watch/providers/movie', {
      'api_key': dotenv.env['TMDB_API_KEY'],
      'watch_region': 'JP',
    });

    final http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      final Map<String, dynamic> decodedBody = json.decode(res.body);
      final List<dynamic> results = decodedBody['results'] as List;
      return results.map((json) => SubsctiptionService.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load providers');
    }
  }

  Future<List<SubsctiptionService>> fetchFilteredProviders() async {
    final repository = SubscriptionServiceRepository();
    final allProviders = await repository.fetchProviders();

    final filteredProviders = allProviders
        .where((provider) => desiredProviderIds.contains(provider.providerId))
        .toList();

    return filteredProviders;
  }
}

final providerListProvider =
    FutureProvider<List<SubsctiptionService>>((ref) async {
  final repository = SubscriptionServiceRepository();
  return repository.fetchProviders();
});
