import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/property/screens/payment_screen.dart';
import 'package:mabeet/Features/user/rentNow/widgets/rent_now_property_widget.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/data/models/property.dart';

class RentNowScreen extends StatefulWidget {
  final Property property;

  RentNowScreen({super.key, required this.property});

  @override
  State<RentNowScreen> createState() => _RentNowScreenState();
}

class _RentNowScreenState extends State<RentNowScreen> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  bool isChecked = false;

  int get nights {
    return selectedDates.end.difference(selectedDates.start).inDays;
  }

  double get totalPrice {
    return nights * widget.property.costPerNight + 10;
  }

  String formatDatePretty(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return "${date.day} ${months[date.month - 1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rent Now")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RentalsProperty(property: widget.property),
              SizedBox(height: 25),
              Text(
                "Period",
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("date", style: TextStyle(color: AppColors.gray400)),
                    Text(
                      "${formatDatePretty(selectedDates.start)} - "
                      "${formatDatePretty(selectedDates.end)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.calendar_month,
                  size: 35,
                  color: AppColors.primary800,
                ),

                trailing: IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    color: AppColors.gray500,
                    size: 35,
                  ),
                  onPressed: () async {
                    final DateTimeRange? pickedRange =
                        await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                          initialDateRange: selectedDates,
                        );

                    if (pickedRange != null) {
                      setState(() {
                        selectedDates = pickedRange;
                      });
                    }
                  },
                ),
              ),
              Divider(),
              Text(
                "Make sure to check your date before making anysort of payments",
              ),
              SizedBox(height: 25),
              Text(
                "Payments",
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                leading: Icon(
                  Icons.credit_card,
                  size: 35,
                  color: AppColors.primary800,
                ),
                title: Text(
                  "Credit or Debit card",
                  style: TextStyle(color: AppColors.darkText, fontSize: 17),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add, color: AppColors.gray500, size: 35),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PaymentScreen()));
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                leading: Icon(
                  Icons.paypal,
                  size: 35,
                  color: AppColors.primary800,
                ),
                title: Text(
                  "Paypal",
                  style: TextStyle(color: AppColors.darkText, fontSize: 17),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add, color: AppColors.gray500, size: 35),
                  onPressed: () {},
                ),
              ),
              Divider(),
              SizedBox(height: 5),
              Text(
                "Price Details",
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Period time", style: TextStyle(fontSize: 18)),
                        Text(
                          "1 Night",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly payment", style: TextStyle(fontSize: 18)),
                        Text(
                          "\$${widget.property.costPerNight}",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax", style: TextStyle(fontSize: 18)),
                        Text(
                          "\$10.00",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkText,
                          ),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.primary800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 5),
              Text(
                "Terms and Conditions",
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),

                title: Text(
                  'Dear Guest,\n\n'
                  'By making a payment and confirming your booking, you agree that if you cancel your reservation more than 3 days before the start date, you will receive a full refund. For cancellations made within 3 days of the start date, 90% of the payment will be refunded.\n\n'
                  'We wish you a pleasant stay!',
                  style: TextStyle(color: AppColors.darkText, fontSize: 14),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,

                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                      //widget.onTermsChanged(isChecked);
                    },
                    splashRadius: 15,
                  ),
                  Text("I agree", style: TextStyle(color: AppColors.darkText)),
                ],
              ),
              Divider(),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!isChecked) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("You must agree to the terms and conditions"),
                backgroundColor: AppColors.errorBase,
              ),
            );
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Booking confirmed successfully ✅"),
              backgroundColor: AppColors.primary800,
            ),
          );
        },
        label: Text("Confirm the booking"),
        backgroundColor: AppColors.primary700,
        extendedPadding: EdgeInsets.symmetric(horizontal: 30),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
