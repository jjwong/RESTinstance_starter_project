*** Settings ***
Documentation   Example test to demonstrate basic authentication
...             for RESTful endpoints using the RESTinstance library.
...
...             This is using an example site, that may or may not always be up.
...
...             You can test different permutations using a data driven style,
...             but this is mainly to demonstrate how to pass in credentials so
...             you can login and verify status codes.

Library         REST            url=https://reqres.in

*** Test Cases ***
POST Login Valid User
    [Documentation]  Our schema validates the status code and the required fields
    ...              that the request should return.
    ...              In this case, we expect a token.
    
    Expect Response     ${CURDIR}/schemas/valid/basic_auth_schema.json
    POST    /api/login      body={"email":"peter@klaven","password":"cityslicka"}

POST Login Valid User Missing Password
    [Documentation]  We also want to validate the error state, so we pass in our
    ...              invalid schema to match the output.
    ...              For this scenario we are looking for a 400 status code
    ...              and the error message "Missing password". You may likely
    ...              only ever care about the status code returning.

    Expect Response     ${CURDIR}/schemas/invalid/response.json
    POST    /api/login      body={"email":"peter@klaven"}