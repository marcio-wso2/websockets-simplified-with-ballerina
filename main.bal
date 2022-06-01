import ballerina/websocket;

enum Location { 
    Q, R, S, T, U, V, W
}

type Route Location[];

final Route route1 = [Q, R, S, V, W];
final Route route2 = [Q, T, U, V, W];

function negotiatePickUp(string url, string name, Location location) returns [Location, Location]|error {
    
    if (location == Q || location == W){
        return error ("No pick-ups happen at the start point (Q) and the end point (W)");
    }

    websocket:Client wsClient = check new(url + "?name=" + name);
    _ = check wsClient->writeTextMessage(location.toString());

    

    string|websocket:Error nextStopAsString = check wsClient->readTextMessage();
    if (nextStopAsString is string){
        Location finalizedPickUpPoint = location;
        Location nextStop = check stringToLocation(nextStopAsString);

        if (hasCompletlyMissedTheShuttle(location, nextStop)){
            _ = check wsClient->close(timeout = 2);
        } else {
            if (isDifferentRoute(location, nextStop)){
                _ = check wsClient->writeTextMessage(V.toString());

                nextStopAsString = check wsClient->readTextMessage();
                finalizedPickUpPoint = V;
                nextStop = check stringToLocation(check nextStopAsString);
            }

            if (hasCompletlyMissedTheShuttle(location, nextStop)){
                _ = check wsClient->close(timeout = 2);
            }      
        }

        return [finalizedPickUpPoint, nextStop];
    } else {
        return error (nextStopAsString.toString());
    }
}

function hasCompletlyMissedTheShuttle(Location pickupLocation, Location nextStop) returns boolean{
    if (nextStop == W){
        return true;
    } else if (nextStop == V && pickupLocation != V){
        return true;
    } else if (pickupLocation == V ){
        return false;
    } else if (isSameRoute(pickupLocation, nextStop)){
        Route route = getRoute(pickupLocation);
        int? pl = route.indexOf(pickupLocation);
        int? ns = route.indexOf(nextStop);

        if (pl is int && ns is int){
            return pl < ns;
        } else {
            panic error ("alg is broken :P");
        }
    } 

    return false;
}

function getRoute(Location nextLocation) returns Route{
    int? i = route1.indexOf(nextLocation);
    if (i is int){
        return route1;
    } else {
        return route2;
    }
}

function isDifferentRoute(Location pickupLocation, Location nextStop) returns boolean{
    return !isSameRoute(pickupLocation, nextStop);
}

function isSameRoute(Location pickupLocation, Location nextStop) returns boolean{

   if (pickupLocation == V){
       return true;
   }

    int? i = route1.indexOf(pickupLocation); 
    int? z = route1.indexOf(nextStop);

    return (i is int && z is int) || (i !is int && z !is int);
}

function stringToLocation(string location) returns Location|error {

    match location {
        "R" => {return R;}
        "S" => {return S;}
        "T" => {return T;}
        "U" => {return U;}
        "V" => {return V;}
        _ => {return error("Invalid Location");}
    }

}

