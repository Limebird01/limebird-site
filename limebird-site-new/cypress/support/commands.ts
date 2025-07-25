/// <reference types="cypress" />

// Custom command for checking accessibility
Cypress.Commands.add('checkA11y', () => {
  cy.checkA11y()
})

// Custom command for taking Percy snapshots
Cypress.Commands.add('percySnapshot', (name: string) => {
  cy.percySnapshot(name)
})

// Make this file a module to satisfy TypeScript
export {} 