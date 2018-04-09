*** Settings ***
Documentation   Example tests with RESTinstance Library
...             we will do some basic api testing using the FakerLibrary
...
...             There is a minor conflict with the Boolean type when using Faker,
...             but you just need to specify which library to use. i.e REST.Boolean
...             is likely what you want to do when doing verifications

Library         REST            url=https://jsonplaceholder.typicode.com
Library         FakerLibrary    WITH NAME   Faker

*** Test Cases ***
POST Generated User
    [Documentation]  The example site does not persist changes, but this is how you would generate data using faker.
    ...              We generate a dictionary and post it to the /users endpoint, we then verify its response code.
    &{generated_user}=    Generate User
    POST                  /users                      ${generated_user}
    Integer               response status             201

    [Teardown]  Output  response body

GET Existing User
    [Documentation]  This example shows you how to traverse the json tree and how to verify integer and string types.
    GET         /users/1
    Integer     response body id                1
    String      response body name              Leanne Graham
    String      response body address street    Kulas Light
    String      response body address geo lat   -37.3159

    [Teardown]  Output  response body

PATCH Existing User With New Name
    [Documentation]  Update an existing user with a new name and verify it has been done.
    &{json_response}=     GET   /users/2
    String      response body name        Ervin Howell
    PATCH       /users/2                  { "name": "Potato Overlord" }
    String      response body name        Potato Overlord

DELETE Existing User Successfully
    DELETE      /users/3
    Integer     response status           200    202     204
    # You might want to do a get and verify 400s, but this should suffice on the example site.

*** Keywords ***
Generate User
    [Documentation]  Create a dictionary with keys name and id, with auto generated values
    ...              Random Number 3 means that it will be a 3 digit number that is returned
    ...              Once we finish creating the dictionary, show a log and return it.
    &{random_user}=         Create Dictionary
    ${random_user.name}=    Faker.Name
    ${random_user.id}=      Faker.Random_Number    3
    Log                     ${random_user}

    [Return]                ${random_user}

Verify Generated User
    [Documentation]  To complete the example, this is how you would verify the values in a typical
    ...              response. Give it a try with your own project!
    [Arguments]  ${random_user}
    String       response body name    ${random_user.name}
    Integer      response body id      ${random_user.id}