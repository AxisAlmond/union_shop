# Union Shop

A Flutter e-commerce application showcasing a modern shop interface with product browsing and navigation features.

## Author

**Alecxis Belleza Almoneda**  
GitHub: [@AxisAlmond](https://github.com/AxisAlmond)

## Features

### 🏠 Home Screen
- **Custom Header**: Branded header with navigation controls and action icons (search, profile, shopping cart, menu)
- **Hero Section**: Eye-catching hero banner with call-to-action button for browsing products
- **Product Grid**: Responsive grid layout displaying featured products with images, titles, and prices
- **Adaptive Layout**: Automatically adjusts between 1-column (mobile) and 2-column (tablet/desktop) layouts based on screen width

### 📦 Product Page
- **Product Details**: Dedicated page showing product information including:
  - High-quality product images with error handling
  - Product name and pricing
  - Detailed product descriptions
- **Consistent Navigation**: Same header and footer across all pages for seamless user experience

### ℹ️ About Us Page
- Accessible information page about the shop
- Reachable via footer navigation

### 🧭 Navigation System
- **Named Routes**: Utilizes Flutter's named route system for clean navigation
- **Route Definitions**:
  - `/` - Home screen
  - `/product` - Product details page
  - `/about` - About Us page
- **Clickable Product Cards**: Tap any product card to navigate to the product page
- **Header Logo Navigation**: Click the logo to return home from any page

### 🎨 Footer Widget
- **Reusable Component**: Consistent footer across all pages
- **Quick Links**:
  - About Us (navigates to `/about` route)
  - Contact Us (placeholder for future implementation)
- **Copyright Information**: Displays shop branding and copyright notice
- **Responsive Layout**: Adapts to different screen sizes

### 🎨 Design & Theming
- **Color Scheme**: Custom purple theme (`#4d2963`) throughout the application
- **Consistent Styling**: Unified design language across all pages
- **Error Handling**: Graceful fallbacks for missing images with placeholder icons
- **Responsive Design**: Mobile-first approach that scales to larger screens

## Project Structure

```
lib/
├── main.dart              # App entry point, home screen, and route configuration
├── product_page.dart      # Product details page
├── aboutus_page.dart      # About Us page
└── widgets/
    └── footer.dart        # Reusable footer component

test/
├── footer_test.dart       # Widget tests for footer component
├── home_test.dart         # Tests for home screen
├── product_test.dart      # Tests for product page
└── widget_test.dart       # General widget tests
```

## Testing

The application includes comprehensive widget tests covering:
- Footer component functionality and navigation
- Text display and styling verification
- Button interaction and clickability
- Navigation flow validation

Run tests with:
```bash
flutter test
```

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (comes with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/AxisAlmond/union_shop.git
cd union_shop
```

2. Run the application:
```bash
flutter run
```

For web deployment:
```bash
flutter run -d chrome
```

## Development Notes

### Current Limitations
- Product data is currently hardcoded (placeholder implementation)
- Contact Us link is a placeholder without functionality
- Asset images use placeholder paths and may require configuration
- Some header buttons have placeholder callbacks

### Future Enhancements
- Integration with backend API for dynamic product data
- Shopping cart functionality
- User authentication and profile management
- Contact form implementation
- Search functionality
- Product filtering and sorting
- Payment integration

## Technologies Used

- **Flutter**: UI framework for cross-platform development
- **Dart**: Programming language
- **Material Design**: UI component library

## License

This project is available for educational purposes.

---

**Note**: This is a student project demonstrating Flutter development skills including widget composition, navigation, state management, and responsive design.
