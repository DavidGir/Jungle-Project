describe('Product Details', () => {
  beforeEach(() => {

    cy.visit('/')
  });

  it('Navigates to a product detail page when a product is clicked', () => {
    cy.get('.products article').first().click();

    cy.url().should('include', '/products/');
  });

});