# Union Shop

A comprehensive Flutter e-commerce application for the University of Portsmouth Union Shop, featuring product browsing, shopping cart functionality, and a fully responsive design with extensive test coverage.

## Author

**Alecxis Belleza Almoneda**  
GitHub: [@AxisAlmond](https://github.com/AxisAlmond)

## Features

### 🏠 Home & Navigation
- **Responsive Header**: Branded navigation with adaptive layout
  - Desktop mode (>600px): Full navigation links (Home, Shopping, SALE!, About, Login/Sign up)
  - Mobile mode (≤600px): Collapsible menu with bottom sheet
  - Shopping cart badge with live item count
  - Search, profile, and menu icons
- **Hero Section**: Eye-catching banner with call-to-action
- **Product Grid**: Responsive layout (1-column mobile, 2-column tablet/desktop)
- **Collections**: Browse curated product collections (Apparel, Sales)

### 🛒 Shopping Cart System
- **Add to Cart**: Add products with size and color options from product pages
- **Cart Management**: 
  - View all cart items with product details
  - Adjust quantities with increment/decrement controls
  - Remove items with undo functionality via snackbar
  - Real-time subtotal calculation
- **Persistent State**: Cart state maintained across page navigation using ChangeNotifier
- **Visual Feedback**: Cart badge in header shows total item count

### 📦 Product Features
- **Product Pages**: Detailed view with images, descriptions, and pricing
  - Size and color selection dropdowns
  - Quantity selector
  - Sale pricing with original price strikethrough
  - Add to cart button with confirmation snackbar
- **Product Cards**: Clickable cards with image, title, and price
  - Sale badge for discounted items
  - Smart navigation with SEO-friendly URLs (`/collections/{id}/{slug}`)
  - Image error handling with fallback icons
- **Collection Pages**: Browse products by category
  - Apparel collection
  - Sales/promotional items

### 👤 User Pages
- **Authentication Pages**: Login and Sign-up interfaces
- **About Us**: Information about the Union Shop

### 🎨 Reusable Widgets
- **Header (Head)**: Consistent navigation across all pages
- **Footer**: Site-wide footer with:
  - Opening times (Mon-Fri 9am-6pm, Sat 10am-5pm, Sun 11am-4pm)
  - Location information (Student Union Building, University of Portsmouth)
  - Quick links (About Us, Contact, Newsletter)
  - Responsive two-column layout
- **Product Card**: Reusable product display component
- **Collection Card**: Reusable collection display component

### 🧭 Advanced Routing
- **go_router Integration**: Modern declarative routing system
- **Route Definitions**:
  - `/` - Home screen
  - `/about` - About Us page
  - `/login` - Login page
  - `/signup` - Sign-up page
  - `/collections` - All collections
  - `/collections/{id}` - Specific collection (e.g., `/collections/apparel`)
  - `/collections/{id}/{slug}` - Product with collection context
  - `/product` - Product details (fallback)
  - `/cart` - Shopping cart page
- **Smart Navigation**: SEO-friendly URLs with product slugs

### 🎨 Design & Theming
- **Color Scheme**: Custom purple theme (`#4d2963`) with consistent branding
- **Responsive Design**: Mobile-first approach with breakpoints at 600px
- **Error Handling**: Graceful image fallbacks with placeholder icons
- **Accessibility**: Semantic HTML structure and proper widget hierarchy

## Project Structure
├── lib/
├── main.dart # App entry point and routing configuration
├── models/
│ ├── cart_item.dart # Cart item model with comparison logic
│ ├── collection.dart # Collection data model
│ └── product.dart # Product data model
├── pages/
│ ├── aboutus_page.dart # About Us page
│ ├── authentication_page.dart # Login page
│ ├── cart_page.dart # Shopping cart interface
│ ├── collection_page.dart # Single collection view
│ ├── collections_page.dart # All collections view
│ ├── product_page.dart # Product details with cart integration
│ └── signup_page.dart # Sign-up page
├── repositories/
│ ├── cart_repository.dart # Cart state management (ChangeNotifier)
│ └── collection_repository.dart # Collection data provider
└── widgets/
├── collectioncard.dart # Reusable collection card
├── footer.dart # Footer with opening times
├── head.dart # Responsive header with cart badge
└── productcard.dart # Reusable product card

test/
├── widget_test.dart # Footer widget tests
├── models/
│ └── cart_item_test.dart # Cart item model tests
├── pages/
│ └── cart_page_test.dart # Cart page widget tests
├── repositories/
│ ├── cart_repository_test.dart # Cart repository unit tests
│ └── collection_repository_test.dart # Collection data tests
└── widgets/
├── collectioncard_test.dart # Collection card widget tests
├── head_test.dart # Header widget tests
└── productcard_test.dart # Product card widget tests

## Dependencies

> **Note**: All dependencies are specified in `pubspec.yaml`

Key dependencies include:
- **go_router** (^17.0.0): Advanced routing and navigation
- **cupertino_icons** (^1.0.0): iOS-style icons
- **flutter_test**: Testing framework
- **test_cov_console** (^0.2.2): Test coverage reporting

## Testing

The application includes comprehensive test coverage across multiple layers:

### Test Suite Overview
- **Unit Tests**: Models and repositories (13 tests)
  - Cart item comparison logic and calculations
  - Cart repository state management
  - Collection data retrieval
- **Widget Tests**: Reusable components (17 tests)
  - Header responsiveness and cart badge
  - Product and collection cards
  - Footer layout and content
- **Integration Tests**: Page-level functionality (6 tests)
  - Cart page empty and populated states
  - Item quantity adjustments
  - Remove with undo functionality

### Running Tests

Run all tests:
```bash
flutter test
```

Run specific test file:
```bash
flutter test test/repositories/cart_repository_test.dart
```

Run tests with coverage:
```bash
flutter test --coverage
```

**Current Test Status**: 36/41 tests passing (88% pass rate)

## Getting Started

### Prerequisites
- Flutter SDK (>=2.17.0 <4.0.0)
- Dart SDK (comes with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/AxisAlmond/union_shop.git
cd union_shop
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

For web deployment:
```bash
flutter run -d chrome
```

## Development Notes

### Architecture
- **State Management**: ChangeNotifier for cart state (no external packages)
- **Design Pattern**: Repository pattern for data access
- **Navigation**: Declarative routing with go_router
- **Testing**: Comprehensive unit and widget tests

### Current Implementation
- In-memory cart storage (session-based)
- Hardcoded product and collection data
- Placeholder callbacks for search and profile features
- Image assets require configuration in `assets/images/`

### Future Enhancements
- Backend API integration for product catalog
- Persistent cart storage (SharedPreferences/Database)
- User authentication with backend
- Search functionality implementation
- Payment gateway integration
- Order history and tracking
- Product reviews and ratings
- Wishlist functionality
- Enhanced filtering and sorting

## Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **go_router**: Declarative routing
- **Material Design**: Component library and design system

## License

This project is available for educational purposes.

---

**Note**: This is a student project demonstrating advanced Flutter development skills including state management, routing, repository pattern, responsive design, and comprehensive testing strategies
