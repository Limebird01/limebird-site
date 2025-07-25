describe('Homepage', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('should load the homepage', () => {
    cy.get('body').should('be.visible')
  })

  it('should have accessible navigation', () => {
    cy.checkA11y()
  })

  it('should take a visual snapshot', () => {
    cy.percySnapshot('Homepage')
  })

  it('should be responsive', () => {
    // Test mobile
    cy.viewport(375, 667)
    cy.percySnapshot('Homepage-mobile')
    
    // Test tablet
    cy.viewport(768, 1024)
    cy.percySnapshot('Homepage-tablet')
    
    // Test desktop
    cy.viewport(1280, 720)
    cy.percySnapshot('Homepage-desktop')
  })
})

// Make this file a module to satisfy TypeScript
export {} 