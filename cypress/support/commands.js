/* eslint-disable cypress/no-unnecessary-waiting */
/// <reference types="Cypress" />

import locators from '../fixtures/locators';

const {
    registrationForm,
} = locators;

Cypress.Commands.add('completeRegistrationDetails', (firstName, lastName, email) => {
    cy.get(registrationForm.inputFirstName).type(firstName);
    cy.get(registrationForm.inputLastName).type(lastName);
    cy.get(registrationForm.inputEmail).type(email);
});
