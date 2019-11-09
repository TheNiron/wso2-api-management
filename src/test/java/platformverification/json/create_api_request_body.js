{
   "id": "7a2298c4-c905-403f-8fac-38c73301631f",
   "name": "platform-verification-API",
   "description": "",
   "context": "/testResource",
   "version": "1.0.0",
   "provider": "admin",
   "apiDefinition": "{\"swagger\":\"2.0\",\"paths\":{\"\/posts/1\":{\"get\":{\"responses\":{\"200\":{\"description\":\"\"}},\"x-auth-type\":\"Application & Application User\",\"x-throttling-tier\":\"Unlimited\"}}},\"info\":{\"title\":\"WorldBank\",\"version\":\"1.0.0\"}}",
   "wsdlUri": null,
   "status": "CREATED",
   "responseCaching": "Disabled",
   "cacheTimeout": 300,
   "destinationStatsEnabled": null,
   "isDefaultVersion": false,
   "type": "HTTP",
   "transport":    [
      "http",
      "https"
   ],
   "tiers": ["Unlimited"],
   "maxTps":    {
      "sandbox": 5000,
      "production": 1000
   },
   "thumbnailUri": null,
   "visibility": "PUBLIC",
   "visibleRoles": [],
   "endpointConfig": "{\"production_endpoints\":{\"url\":\"https://jsonplaceholder.typicode.com\",\"config\":null},\"sandbox_endpoints\":{\"url\":\"https://jsonplaceholder.typicode.com\",\"config\":null},\"endpoint_type\":\"http\"}",
   "gatewayEnvironments": "Production and Sandbox",
   "subscriptionAvailability": null,
   "subscriptionAvailableTenants": [],
   "corsConfiguration":    {
      "accessControlAllowOrigins": ["*"],
      "accessControlAllowHeaders":       [
         "authorization",
         "Access-Control-Allow-Origin",
         "Content-Type",
         "SOAPAction"
      ],
      "accessControlAllowMethods":       [
         "GET"
      ],
      "accessControlAllowCredentials": false,
      "corsConfigurationEnabled": false
   }
}