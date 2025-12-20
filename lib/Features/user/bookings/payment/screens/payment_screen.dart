import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/strings.dart';
import '../cubit/payment_cubit.dart';
import '../cubit/payment_state.dart';
import '../widgets/payment_card_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {},
      builder: (context, state) {
        final paymentCubit = context.watch<PaymentCubit>();
        final cardNumber = paymentCubit.paymentCardNumber.text;
        final cvv = paymentCubit.paymentCvv.text;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.enterYourCardTitle.tr(),
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
                  PaymentCardWidget(
                    cardNumber: cardNumber,
                    cvv: cvv,
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
            label: Text(AppStrings.addCardButton.tr()),
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
    if (value == null || value.isEmpty || value.length != 16) {
      return 'Number must be 16 characters.';
    }
    return null;
  }

  String? _validateCvv(value) {
    if (value == null || value.isEmpty || value.length != 3) {
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
