describe('Button Component', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('should render button with correct text', () => {
    cy.get('button').should('contain', 'Click me')
  })

  it('should be accessible', () => {
    cy.injectAxe()
    cy.checkA11y()
  })

  it('should be clickable', () => {
    cy.get('button').click()
    // Add assertions for click behavior
  })

  it('should have proper styling', () => {
    cy.get('button').should('have.class', 'inline-flex')
  })
}) 