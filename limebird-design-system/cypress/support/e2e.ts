// Import commands.js using ES2015 syntax:
import './commands'

// Alternatively you can use CommonJS syntax:
// require('./commands')

// Add Percy for visual testing
import '@percy/cypress'

// Add axe-core for accessibility testing
import 'cypress-axe'

// Configure axe-core
beforeEach(() => {
  cy.injectAxe()
})

// Custom command for checking accessibility
Cypress.Commands.add('checkA11y', () => {
  cy.checkA11y()
})

// Custom command for taking Percy snapshots
Cypress.Commands.add('percySnapshot', (name: string) => {
  cy.percySnapshot(name)
})

// Custom command for testing responsive design
Cypress.Commands.add('testResponsive', (name: string) => {
  // Test mobile
  cy.viewport(375, 667)
  cy.percySnapshot(`${name}-mobile`)
  
  // Test tablet
  cy.viewport(768, 1024)
  cy.percySnapshot(`${name}-tablet`)
  
  // Test desktop
  cy.viewport(1280, 720)
  cy.percySnapshot(`${name}-desktop`)
}) 