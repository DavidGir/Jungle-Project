# Jungle Project

## Description

Jungle is an innovative e-commerce platform offering a unique shopping experience for plant enthusiasts. From exotic flowers to classic greenery, Jungle caters to all your botanical needs.

## Application Screenshots

### Home Page
![Home Page](./public/screenshots/Jungle-Home_page.png "Home Page of Jungle")

### Product Detail View
![Product Detail](./public/screenshots/Product-Details.png "Product Detail View")

### My Cart View 
![My Cart](./public/screenshots/My-Cart.png "My Cart View")

### Categories View
![Categories](./public/screenshots/Categories.png "Categories View")

## Features

- **Interactive Shopping Cart:** Allows users to add and remove products from their cart.
- **Category-Based Navigation:** Users can browse products based on categories.
- **Secure User Authentication:** Safe and secure login system for users.
- **Admin Dashboard:** Special access for admins to manage products and categories.

## Setup and Installation

1. Clone the repository:
```bash
git clone git@github.com:DavidGir/Jungle-Project.git
```


2. Navigate to the project's directory:

 ```bash
cd Jungle-Project
```

3. Run `bundle install` to install dependencies.

4. Create `config/database.yml` by copying `config/database.example.yml`.

5. Create `config/secrets.yml` by copying `config/secrets.example.yml`.

6. Run `bin/rails db:reset` to create, load and seed the database.

7. Create `.env` file based on `.env.example`.

8. Sign up for a [Stripe](https://stripe.com) account.

9. Put Stripe (test) keys into appropriate .env variables.

10. Run `bin/rails s -b 0.0.0.0` to start the server.

## Database Configuration

If Rails is complaining about authentication to the database, uncomment the `user` and `password` fields from `config/database.yml` in the development and test sections, and replace `development` with an existing database user if necessary.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: [Stripe Testing](https://stripe.com/docs/testing#cards).

## Technologies Used

- **Ruby on Rails:** Server-side web application framework.
- **PostgreSQL:** Database system.
- **Bootstrap:** Front-end framework for styling.
- **Sass/CSS:** Used for advanced styling.
- **jQuery:** JavaScript library for additional interactivity.

## Testing

This project uses Cypress, Rails, and RSpec to test features and functionalities, ensuring a robust and reliable application. 

### Cypress

Cypress is used for end-to-end testing. It helps in testing the complete flow of the application from a user's perspective.

### RSpec

RSpec is utilized for unit and integration testing of the Ruby code, particularly the Rails backend. It aids in ensuring the reliability and stability of the application's business logic.

## Contributing

Contributions to Jungle are welcome. Please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b new-feature`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin new-feature`.
5. Submit a pull request.

## Future Implementation Considerations

- **Responsive Design**: Optimizing for various devices and screens.
- **Search Functionality**: To find products easily.
- **User Profiles**: For a personalized shopping experience.
- **Social Sharing**: Share favorite products on social media.
- **Product Ratings and Reviews**: For community engagement and feedback.
- **Inventory Management**: Automatic updates post-purchase.

## Authors and Acknowledgment

Developed by David Giroux.

Special thanks to mentors and colleagues at Lighthouse Labs.
