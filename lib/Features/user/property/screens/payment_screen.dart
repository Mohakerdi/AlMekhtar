import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/property/cubit/payment_cubit.dart';
import 'package:mabeet/Features/user/property/cubit/payment_state.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String cardNumber = '7537  5221  8412  1212';
  String cvv = '619';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Enter Your Card',
              style: AppTextStyles.bodyLargeSemiBold,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        AppImages.kPaymentCard,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 100),
                            Text(
                              context.watch<PaymentCubit>().paymentCardNumber.text,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(
                              context.watch<PaymentCubit>().paymentCvv.text,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Card Number', style: AppTextStyles.bodyLargeSemiBold),
                  TextFormField(
                    buildCounter:
                        (
                          BuildContext context, {
                          required int currentLength,
                          required int? maxLength,
                          required bool isFocused,
                        }) => null,
                    keyboardType: TextInputType.phone,
                    maxLength: 16,
                    validator: _validateCardNumber,
                    decoration: InputDecoration(helperText: ' '),
                    controller: context.read<PaymentCubit>().paymentCardNumber,
                    onChanged: (val){
                      setState(() {});
                    },
                  ),
                  Text('CVV', style: AppTextStyles.bodyLargeSemiBold),
                  TextFormField(
                    buildCounter:
                        (
                          BuildContext context, {
                          required int currentLength,
                          required int? maxLength,
                          required bool isFocused,
                        }) => null,
                    keyboardType: TextInputType.phone,
                    maxLength: 3,
                    validator: _validateCvv,
                    decoration: InputDecoration(helperText: ' '),
                    controller: context.read<PaymentCubit>().paymentCvv,
                    onChanged: (val){
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _sendForm,
            label: Text("Add Card"),
            backgroundColor: AppColors.primary700,
            extendedPadding: EdgeInsets.symmetric(horizontal: 130),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  String? _validateCardNumber(value) {
    if (value == null || value.isEmpty) {
      return 'Card Number is required.';
    }
    if (value.length != 16) {
      return 'Number must be 16 characters.';
    }
    return null;
  }

  String? _validateCvv(value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required.';
    }
    if (value.length != 3) {
      return 'CVV must be 3 characters.';
    }
    return null;
  }

  void _sendForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Payment Completed!')));
    }
  }
}
