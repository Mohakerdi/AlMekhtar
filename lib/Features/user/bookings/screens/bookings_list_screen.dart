import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/widgets/shimmer_loading_property.dart';
import 'package:mabeet/data/models/booking_model.dart';
import 'package:mabeet/data/repos/booking_repo.dart';
import 'package:mabeet/Features/user/bookings/services/booking_cubit.dart';
import 'package:mabeet/Features/user/bookings/services/booking_state.dart';
import '../widgets/booking_property.dart';

class BookingListScreen extends StatefulWidget {
  final BookingType type;

  const BookingListScreen({super.key, required this.type});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //delay to ensure data is available
      _fetchBookings();
    });
  }

  void _fetchBookings() {
    final cubit = context.read<BookingCubit>();
    switch (widget.type) {
      case BookingType.pending:
        cubit.loadPendingBookings();
        break;
      case BookingType.active:
        cubit.loadActiveBookings();
        break;
      case BookingType.history:
        cubit.loadHistoryBookings();
        break;
    }
  }

  List<Booking> _getBookings(BookingLoaded state) {
    switch (widget.type) {
      case BookingType.pending:
        return state.pendingBookings;
      case BookingType.active:
        return state.activeBookings;
      case BookingType.history:
        return state.historyBookings;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PropertyShimmer();
            },
          );
        } else if (state is BookingLoaded) {
          final bookings = _getBookings(state);

          if (bookings.isEmpty) {
            return Center(
              child: Text('No ${widget.type.name} bookings found.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return BookingProperty(booking: bookings[index]);
            },
          );
        } else if (state is BookingError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.message}'),
                ElevatedButton(
                  onPressed: _fetchBookings,
                  child: const Text('Try Again'),

                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Select a tab to view bookings.'));
        }
      },
    );
  }
}
