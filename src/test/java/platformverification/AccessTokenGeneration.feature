@ignore
Feature: Create access token
  Scenario: Create access tokens needed for various API requests based on scope

    Given url accessTokenUrl
    And path 'token'
    And header Authorization = call read('json/basic-auth.js') {username: '#(publisherConsumerKey)', password: '#(publisherConsumerSecret)'}
    And form field grant_type = 'password'
    And form field username = amUsername
    And form field password = amPassword
    And form field scope = oAuthScope
    When method post
    Then status 200
    * def AccessToken = response.access_token

