class PaymentOptionResponse {
  int id;
  String paymentName;
  bool isSelected = false;

  PaymentOptionResponse({this.id, this.paymentName});

  static List<PaymentOptionResponse> paymentOptions() {
    return <PaymentOptionResponse>[
      PaymentOptionResponse(id: 1, paymentName: "Cash on delivery"),
      PaymentOptionResponse(id: 2, paymentName: "Using Credit / debit card")
    ];
  }
}