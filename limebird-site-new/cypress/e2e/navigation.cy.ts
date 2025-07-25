export {}

describe('Navigation links', () => {
  const links = [
    { path: '/services', text: 'Services' },
    { path: '/products', text: 'Products' },
    { path: '/terms', text: 'Terms' },
    { path: '/privacy', text: 'Privacy' },
  ];

  beforeEach(() => {
    cy.visit('/');
  });

  context('Main navigation (desktop)', () => {
    links.forEach(link => {
      it(`should navigate to ${link.text} page from main nav`, () => {
        cy.get(`[data-cy="nav-link-${link.text.toLowerCase()}"]`).click();
        cy.url().should('include', link.path);
        cy.get('h1').should('contain', link.text);
        cy.visit('/'); // Go back for next test
      });
    });
  });

  context('Footer navigation', () => {
    links.forEach(link => {
      it(`should navigate to ${link.text} page from footer`, () => {
        cy.get('footer').contains('a', link.text).click();
        cy.url().should('include', link.path);
        cy.get('h1').should('contain', link.text);
        cy.visit('/'); // Go back for next test
      });
    });
  });

  context('Mobile navigation', () => {
    beforeEach(() => {
      cy.viewport('iphone-6');
    });
    it('should open the mobile menu', () => {
      cy.get('button').contains('Menu').click();
      cy.get('.bg-popover').should('be.visible');
    });
    links.forEach(link => {
      it(`should navigate to ${link.text} page from mobile nav`, () => {
        cy.get('button').contains('Menu').click();
        cy.get('.bg-popover').contains('a', link.text).click();
        cy.url().should('include', link.path);
        cy.get('h1').should('contain', link.text);
        cy.visit('/'); // Go back for next test
      });
    });
  });
}); 