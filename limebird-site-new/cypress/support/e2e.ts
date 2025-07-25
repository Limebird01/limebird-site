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