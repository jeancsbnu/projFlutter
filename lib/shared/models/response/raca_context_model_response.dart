class RacaContextModelResponse {
  RacaContextModelResponse({
    this.message,
    this.status,
  });

  List<String> message;
  String status;

  factory RacaContextModelResponse.fromJson(Map<String, dynamic> json) => RacaContextModelResponse(
    message: List<String>.from(json["message"].map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x)),
    "status": status,
  };
}