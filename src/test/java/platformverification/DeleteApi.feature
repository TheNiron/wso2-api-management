@ignore
 Feature: Platform verifications tests tear down scenarios

   Scenario: Remove a created application

   # Generate api create access token by calling AccessTokenGeneration.feature
     * call read('AccessTokenGeneration.feature') { oAuthScope: 'apim:subscribe'}

    # Delete application
     Given url amBaseUrl
     And path 'api/am/store/v0.14/applications/'+applicationID
     And header Authorization = 'Bearer '+AccessToken
     When method delete
     Then status 200

   Scenario: Delete a created API
   # Generate api create access token by calling AccessTokenGeneration.feature
     * call read('AccessTokenGeneration.feature') { oAuthScope: 'apim:api_create'}

    # Delete API
    Given url amBaseUrl
    And path 'api/am/publisher/v0.14/apis/'+apiUUID
    And header Authorization = 'Bearer '+AccessToken
    When method delete
    Then status 200
