import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:bitik_bi/l10n/l10n.dart'; // Generated localization file
import 'core/constants/colors.dart';
import 'core/providers/language_provider.dart';
import 'features/home/screens/home_screen.dart';
import 'features/boutiques/screens/boutique_screen.dart';
import 'features/category/screens/category_screen.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/account/screens/account_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'package:bitik_bi/l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const BitikBiApp(),
    ),
  );
}

class BitikBiApp extends StatelessWidget {
  const BitikBiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'Bitik Bi',
          locale: languageProvider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            primaryColor: AppColors.bangladeshGreen,
            scaffoldBackgroundColor: AppColors.zircon,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.bangladeshGreen,
              primary: AppColors.bangladeshGreen,
              secondary: AppColors.meadow,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.meadow,
                foregroundColor: AppColors.richBlack,
              ),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.richBlack),
              bodyMedium: TextStyle(color: AppColors.richBlack),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.zircon,
              selectedItemColor: AppColors.meadow,
              unselectedItemColor: AppColors.richBlack,
            ),
          ),
          home: const LoginScreen(), // Changed to LoginScreen
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    BoutiqueScreen(),
    CategoryScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home, // Localized
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.store),
            label: AppLocalizations.of(context)!.boutique, // Localized
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: AppLocalizations.of(context)!.category, // Localized
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: AppLocalizations.of(context)!.cart, // Localized
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.account, // Localized
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.meadow,
        unselectedItemColor: AppColors.richBlack,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}