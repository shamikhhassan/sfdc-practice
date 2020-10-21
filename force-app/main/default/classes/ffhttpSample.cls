public with sharing class ffhttpSample {

    /*
    * DTO for remote object result
    */
    private class RemoteUser {
        Integer id;
        String name;
        String username;
        String email;
    }

    /*
    * Vanilla HTTP request
    */
    public static RemoteUser[] getUsers() {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:JSONPlaceholder/users');
        request.setMethod('GET');

        HttpResponse response = http.send(request);        
        if (response.getStatusCode() == 200) {
            system.debug(response.getBody());
            return (RemoteUser[])JSON.deserialize(response.getBody(), List<RemoteUser>.class);
        } else {
            System.debug(response.getStatus());
            return new RemoteUser[]{};
        }
    }

    /*
    * FFHTTP request
    */
    public static RemoteUser[] getUsersFfhttp() {
        SimpleClient client = new SimpleClient();
        client.setCredentials(new ffhttp_Client.NamedCredentials('JSONPlaceholder'));

        SimpleClientRequest request = new SimpleClientRequest(
            client,
            '/users',
            ffhttp_Client.REQUEST_METHOD_GET,
            new ffhttp_JsonDeserializer(List<RemoteUser>.class));

        // Execute and parse the response.
        // Alternatively you can use executeUnparsed() to return the response body as a String
        return (RemoteUser[])request.execute();
    }

    /*
    * FFHTTP client implementations
    */
    private class SimpleClient extends ffhttp_Client.AbstractClient {}
    private class SimpleClientRequest extends ffhttp_Client.AbstractClientRequest {
        SimpleClientRequest(IAbstractClient client, String endpoint, String requestMethod, ffhttp_IDeserialize deserializer) {
            super(client, endpoint, requestMethod, null, deserializer);
        }
    }
}