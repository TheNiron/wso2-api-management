Feature: Verify platform Behavior by simulating WSO2 APIM API life cycle

  Background:
    * configure ssl = true

   # After feature Delete the created application and API by calling DeleteApi.feature
    * configure afterFeature = function(){ karate.call('DeleteApi.feature'); }

  Scenario: End to end scenario

   # API Publisher Consumer credential generation
    Given url amBaseUrl
    And path '/client-registration/v0.14/register'
    And header Content-Type = 'application/json'
    And header Authorization = call read('json/basic-auth.js') {username: '#(amUsername)', password: '#(amPassword)'}
    And request read('json/publisher_request_body.js')
    When method post
    Then status 200
    * def publisherConsumerKey = response.clientId
    * def publisherConsumerSecret = response.clientSecret

   # Generate api create access token by calling AccessTokenGeneration feature
    * call read('AccessTokenGeneration.feature') { oAuthScope: 'apim:api_create'}

   # API creation request
    Given url amBaseUrl
    And path 'api/am/publisher/v0.14/apis'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer '+AccessToken
    And request read('json/create_api_request_body.js')
    When method post
    Then status 201
    * def apiUUID = response.id

   # Generate API publish access token by calling AccessTokenGeneration.feature
    * call read('AccessTokenGeneration.feature') { oAuthScope: 'apim:api_publish'}

   # API publish request
    Given url amBaseUrl
    And path '/api/am/publisher/v0.14/apis/change-lifecycle'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer '+AccessToken
    And param apiId = apiUUID
    And param action = 'Publish'
    And request ''
    When method post
    Then status 200

   # Generate application create access token
    * call read('AccessTokenGeneration.feature') { oAuthScope: 'apim:subscribe'}

   # Create a new application
    Given url amBaseUrl
    And path 'api/am/store/v0.14/applications'
    And header Authorization = 'Bearer '+AccessToken
    And request read('json/create_application_request_body.js')
    When method post
    Then status 201
    * def applicationID = response.applicationId

   # Add a new subscription
    Given url amBaseUrl
    And path 'api/am/store/v0.14/subscriptions'
    And header Authorization = 'Bearer '+AccessToken
    * def subscriptionBody = read('json/create_new_subscription.js')
    * set subscriptionBody.apiIdentifier = apiUUID
    * set subscriptionBody.applicationId = applicationID
    And request subscriptionBody
    When method post
    Then status 201

   # Generate application token
    Given url amBaseUrl
    And path 'api/am/store/v0.14/applications/generate-keys'
    And param applicationId = applicationID
    And header Authorization = 'Bearer '+AccessToken
    And request read('json/generate_application_key_request_body.js')
    When method post
    Then status 200
    * def applicationAccessToken = response.token.accessToken

   # Make get request to target WSO2 API using generated access token
    Given url targetApiUrl
    And path 'testResource/1.0.0/posts/1'
    And header Authorization = 'Bearer '+applicationAccessToken
    When method get
    Then status 200
