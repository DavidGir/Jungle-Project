describe('Add to cart', () => {
  beforeEach(() => {

    cy.visit('/')
  });

  it('increases the cart count when a product is added', () => {
    // Check the initial cart count
    cy.get('nav').contains('My Cart (0)');

    // Click on 'Add to Cart' button of the first product
    cy.get('.products article').first().within(() => {
      cy.get('button').contains('Add').click();
    });

    // Check if the cart count has increased
    cy.get('nav').contains('My Cart (1)');
  });


});