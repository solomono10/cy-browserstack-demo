import { Given, When, Then } from "cypress-cucumber-preprocessor/steps";
import locators from '../../../fixtures/locators';

const { registrationForm, subscriptionForm, Welcome } = locators;

Given('I am on the registration page', () => {
    cy.visit('/registration');
});

When('I register with {word}, {word} and {word}', (firstName, lastName, email) => {
    cy.completeRegistrationDetails(firstName, lastName, email);
    cy.get(registrationForm.buttonContinueSubmit).should('contain', 'Submit');
    cy.get('form').submit({ timeout: 5000 });
});

When('I request a catalogue with {word}, {word}, {word} and {word}', (firstName, lastName, email, address) => {
    const { checkboxCatalogue, buttonContinueSubmit } = registrationForm;
    const { inputFirstName, inputLastName, inputAddress } = subscriptionForm;

    // Complete Registration Form
    cy.completeRegistrationDetails(firstName, lastName, email);
    cy.get(checkboxCatalogue).click();
    cy.get(buttonContinueSubmit).should('have.text', 'Continue');
    cy.get('form').submit({ timeout: 5000 });

    // Complete Catalogue Form
    cy.get(inputFirstName).should('have.text', firstName);
    cy.get(inputLastName).should('have.text', lastName);
    cy.get(inputAddress).type(address);
    cy.get('form').submit({ timeout: 5000 });
});

Then('I should see a success message {string}', message => {
    const { textSuccess } = Welcome;

    cy.get(textSuccess).should('have.text', message)
});
