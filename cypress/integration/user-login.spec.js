describe('User Login', () => {
  beforeEach(() => {

    cy.visit('/')
  });

  it('successfully logs in and is redirected to the home page', () => {
    // Navigate to the login page
    cy.get('nav').contains('Login').click();

    // Fill out and submit the login form
    cy.get('input[name="session[email]"]').type('test@example.com');
    cy.get('input[name="session[password]"]').type('password');
    cy.get('form').submit();

    // Check for a successful login indicator
    cy.get('nav').contains('Logged in as test@example.com');
  });
});