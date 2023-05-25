class Package{
  final bool packageStatus;
  final String trackingNum;
  final String carrier;
  final String address;
  Package({required this.address, required this.carrier,
    required this.packageStatus, required this.trackingNum});
}