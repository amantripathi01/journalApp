Feature: API Testing for Jira Ticket Upload System

  Scenario: Testing HTTP POST method for uploading a Jira ticket
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the response status should be 200
    And the response should contain 'Jira ticket successfully uploaded'
  
  Scenario: Testing HTTP POST method with unsupported file types
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'non-PDF file'
    Then the response status should be 400
    And the response should contain 'File type not supported'

  Scenario: Testing HTTP POST method without linking to Jira or Azure Devops
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the system should not require a link to Jira or Azure Devops
    And the response status should be 200
    And the response should contain 'Jira ticket successfully uploaded'

  Scenario: Testing correct recognition of file details
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the response status should be 200
    And the response should contain the 'fileName', 'content', and 'prompt type'

  Scenario: Testing correct parsing of PDF file
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the response status should be 200
    And the system should successfully parse the PDF and extract all the necessary information

  Scenario: Testing regex-based approach for fetching details
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the response status should be 200
    And the system should correctly fetch the 'description', 'title', and 'comments' using regex

  Scenario: Testing performance of system by uploading multiple Jira tickets
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with 'multiple Jira tickets in PDF format'
    Then the response status should be 200
    And the system should be able to handle the load and upload all the tickets without any errors

  Scenario: Testing resilience of system by trying to upload a corrupted PDF
    Given the API base URL 'http://localhost:3000'
    When I send a POST request to '/upload-jira-ticket' with a 'corrupted PDF'
    Then the response status should be 400
    And the system should gracefully handle the error and notify the user

  Scenario: Check user-friendliness of the upload interface
    Given the API base URL 'http://localhost:3000'
    When I navigate to the '/upload-jira-ticket' page
    Then the upload interface should be intuitive and easy to use

  Scenario: Check system's security by checking if any unauthorized user can upload a Jira ticket
    Given the API base URL 'http://localhost:3000'
    When an unauthorized user sends a POST request to '/upload-jira-ticket' with a 'Jira ticket in PDF format'
    Then the response status should be 401
    And the system should prevent the unauthorized user from uploading the ticket
