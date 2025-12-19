import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class PaymentCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cvv;

  const PaymentCardWidget({
    super.key,
    required this.cardNumber,
    required this.cvv,
  });
  String _formatCardNumber(String number) {
    String cleanNumber = number.replaceAll(RegExp(r'\s+'), '');
    if (cleanNumber.length > 16) cleanNumber = cleanNumber.substring(0, 16);
    String formatted = '';
    for (int i = 0; i < cleanNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += '   ';
      }
      formatted += cleanNumber[i];
    }
    int remaining = 16 - cleanNumber.length;
    for(int i = 0; i < remaining; i++) {
      if (i > 0 && (cleanNumber.length + i) % 4 == 0) {
        formatted += '   ';
      }
      formatted += '*';
    }
    return formatted;
  }
  String _formatCvv(String value) {
    if (value.length > 3) value = value.substring(0, 3);
    return value.padRight(3, '*');
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image.asset(
          AppImages.kPaymentCard,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 85),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  _formatCardNumber(cardNumber),
                  style: AppTextStyles.cardDetailMonospace
                ),
              ),
              const SizedBox(height: 50),
              // CVV Display
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  _formatCvv(cvv),
                  style: AppTextStyles.cardDetailMonospace
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}