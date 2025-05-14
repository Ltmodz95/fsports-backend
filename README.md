# 🏪 FSPORT Backend

A robust e-commerce backend system built with Ruby on Rails, designed to handle complex product configurations with compatibility rules and price adjustments.

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/Ltmodz95/fsports-backend.git
cd fsport-backend
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:

database is running of a docker container so run the following steps in order

```bash
docker-compose up
```
and in another terminal 

```bash
rails db:create
rails db:migrate
```

4. Seed the database with sample data:
```bash
rails db:seed
```

## 🏁 Starting the Application

1. Start the Rails server:
```bash
rails s
```

The application will be available at `http://localhost:3000`

## 🔐 API Authentication

The API uses token-based authentication. Include the following header in your requests:
```
Authorization: Bearer your-token-here
```

## 📊 Data Model Architecture

### Core Models and Their Relationships

#### 📑 Category
- Represents product categories
- Has many products
- Provides organization and filtering capabilities

#### 🛍️ Product
- Belongs to a category
- Has many components
- Has many options through components
- Contains base price and stock information
- Default scope filters for in-stock items

#### 🔧 Component
- Belongs to a product
- Has many options
- Represents a configurable part of a product
- Enables modular product configuration

#### ⚙️ Option
- Belongs to a component
- Has many incompatibility rules
- Contains price adjustments
- Tracks stock status
- Default scope filters for in-stock items

#### ⚠️ IncompatibilityRule
- Links two options that cannot be selected together
- Prevents invalid product configurations
- Ensures logical product combinations

#### 💰 PriceAdjustment
- Manages price changes based on option combinations
- Enables complex pricing rules
- Supports both positive and negative adjustments

#### 🛒 Cart & CartItem
- Manages user shopping sessions
- Tracks selected products and options
- Handles quantity and pricing calculations

#### 👤 User & Session
- Manages user authentication
- Handles secure session management
- Provides API access control

## ✨ Benefits of the Architecture

1. **🔄 Flexible Product Configuration**
   - Modular component system allows for complex product variations
   - Easy to add new options and components
   - Supports unlimited product customization

2. **🛡️ Robust Compatibility Management**
   - Prevents invalid product combinations
   - Easy to maintain and update compatibility rules
   - Ensures logical product configurations

3. **💹 Dynamic Pricing System**
   - Supports complex pricing rules
   - Handles price adjustments based on option combinations
   - Easy to modify pricing strategies

4. **📈 Scalable Design**
   - Clear separation of concerns
   - Modular architecture
   - Easy to extend with new features

5. **⚡ Performance Optimized**
   - Default scopes for common queries
   - Efficient database relationships
   - Optimized for common use cases

6. **🔒 Security First**
   - Token-based authentication
   - Secure session management
   - API access control

7. **🧹 Maintainable Codebase**
   - Clear model relationships
   - Consistent coding patterns
   - Well-documented architecture
