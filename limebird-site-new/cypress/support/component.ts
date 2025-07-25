// Import commands.js using ES2015 syntax:
import './commands'

// Add Percy for visual testing
import '@percy/cypress'

// Add axe-core for accessibility testing
import 'cypress-axe'

// Configure axe-core
beforeEach(() => {
  cy.injectAxe()
}) 