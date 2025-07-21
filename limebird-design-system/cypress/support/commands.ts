/// <reference types="cypress" />

// Custom command for checking accessibility
declare global {
  namespace Cypress {
    interface Chainable {
      checkA11y(): Chainable<void>
      percySnapshot(name: string): Chainable<void>
      testResponsive(name: string): Chainable<void>
    }
  }
}

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

// Custom command for testing component interactions
Cypress.Commands.add('testComponent', (componentName: string) => {
  cy.visit(`/components/${componentName}`)
  cy.checkA11y()
  cy.testResponsive(componentName)
})

// Custom command for testing form interactions
Cypress.Commands.add('testForm', (formSelector: string) => {
  cy.get(formSelector).within(() => {
    cy.get('input, textarea, select').each(($input) => {
      cy.wrap($input).should('be.visible')
      cy.wrap($input).should('not.be.disabled')
    })
  })
}) 