import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentService {
  Future<void> makePayment({
    required BuildContext context,
    required double amount,
    required String currency,
  }) async {
    try {
      // Define the payment options
      final paymentItems = [
        PaymentItem(
          label: 'Parking Ticket',
          amount: amount.toString(),
          status: PaymentItemStatus.final_price,
        )
      ];

      // Google Pay or Apple Pay options
      final paymentOptions = PaymentConfiguration(
        googlePay: GooglePayConfiguration(
          environment: GooglePayEnvironment.Test, // or Production
        ),
        applePay: ApplePayConfiguration(
          merchantIdentifier: 'your.merchant.id', // Replace with your merchant ID
        ),
      );

      // Show the payment sheet
      final result = await Pay.pay(
        context: context,
        paymentItems: paymentItems,
        paymentOptions: paymentOptions,
      );

      if (result != null) {
        print('Payment successful: $result');
      } else {
        print('Payment failed or cancelled');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}