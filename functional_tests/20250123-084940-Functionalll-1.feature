Feature: API Testing for Jira Ticket Upload

Scenario: Uploading a Jira ticket as a PDF
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'Jira ticket in PDF format' to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'Jira ticket successfully uploaded'

Scenario: Uploading a non-PDF file
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'non-PDF file' to '/uploadJiraTicket'
Then the response status should be 400
And the response message should be 'Invalid file type'

Scenario: Validating support for limited document types
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'DOCX file' to '/uploadJiraTicket'
Then the response status should be 400
And the response message should be 'Unsupported file type'

Scenario: Uploading Jira ticket as an alternative to linking with Jira or Azure Devops
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'Jira ticket in PDF format' to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'Jira ticket successfully uploaded and linked'

Scenario: Sending file as an array of objects with fileName, content, and prompt type
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'file with specific fileName, content, and prompt type' to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'File successfully sent with all its properties'

Scenario: Checking PDF parsing
Given the API endpoint '/parsePDF'
When I send a POST request with a 'Jira ticket in PDF format' to '/parsePDF'
Then the response status should be 200
And the response should contain 'parsed details'

Scenario: Evaluating upload functionality performance under high load
Given the API endpoint '/uploadMultipleTickets'
When I send a POST request with 'multiple Jira tickets in PDF format' to '/uploadMultipleTickets'
Then the response status should be 200
And the response message should be 'All files uploaded successfully'

Scenario: Assessing upload functionality security
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'Jira ticket in PDF format' to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'File uploaded securely'

Scenario: Checking upload functionality usability
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'Jira ticket in PDF format' to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'Upload process was user-friendly'

Scenario: Verifying upload functionality reliability
Given the API endpoint '/uploadJiraTicket'
When I send multiple POST requests with a 'Jira ticket in PDF format' to '/uploadJiraTicket'
Then all response statuses should be 200
And all response messages should be 'Jira ticket successfully uploaded'

Scenario: Testing upload functionality compatibility across different browsers and platforms
Given the API endpoint '/uploadJiraTicket'
When I send a POST request with a 'Jira ticket in PDF format' from different browsers and platforms to '/uploadJiraTicket'
Then the response status should be 200
And the response message should be 'Upload functionality works across all tested browsers and platforms'
