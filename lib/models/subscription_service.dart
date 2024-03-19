class SubsctiptionService {
  final int providerId;
  final String providerName;
  final String logoPath;

  SubsctiptionService({
    required this.providerId,
    required this.providerName,
    required this.logoPath,
  });

  factory SubsctiptionService.fromJson(Map<String, dynamic> json) {
    return SubsctiptionService(
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      logoPath: json['logo_path'],
    );
  }
}
