import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../index.dart' show AppColors, OneWayFlightCard, HotelCard;

class PlanTripPage extends StatelessWidget {
  const PlanTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          // TabBar can be placed here in the body
          TabBar(
            tabs: const [
              FaIcon(FontAwesomeIcons.plane),
              FaIcon(FontAwesomeIcons.hotel),
            ],
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                return states.contains(WidgetState.focused)
                    ? null
                    : Colors.transparent;
              },
            ),
            labelColor: Theme.of(context).primaryColor,
            labelPadding: EdgeInsets.all(12),
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
          ),
          // TabBarView to show content for each tab
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ListView(
                    children: [
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                      OneWayFlightCard(
                        origin: 'Madrid',
                        destination: 'Lisbon',
                        departureDate: '2022-12-25',
                        price: '200',
                        airlineName: 'Delta',
                        flightNumber: 'DL123',
                        imageUrl:
                            'https://th.bing.com/th?id=OSK.tBkF8a0UmuKhX8VZ-8hMA_AnGTguUv0CReaLS6zKd0c&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: ListView(
                    children: [
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                      HotelCard(
                          hotelName: 'Casablato',
                          hotelLocation: 'Morocco',
                          pricePerNight: '200',
                          rating: '4.5',
                          imageUrl:
                              'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          reviewCount: '200',
                          onBookNowPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
