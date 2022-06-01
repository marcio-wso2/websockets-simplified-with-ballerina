import ballerina/websocket;
import ballerina/test;
import ballerina/uuid;
import websockets_simplified_with_ballerina.shuttle_service as shuttle;

@test:Config
function testPickUpNegotiationSuccess() returns error? {
    shuttle:nextShuttleLocation = "T";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", "amy", "U");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, "amy");
    test:assertEquals(res, ["U", "T"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}


@test:Config
function testPickUpNegotiationSuccess2() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "R";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "S");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["S", "R"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationSuccess3() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "R";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "V");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "R"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationSuccess4() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "S";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "V");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "S"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationSuccess5() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "U";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "V");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "U"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationSuccess6() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "T";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "V");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "T"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationSuccess7() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "R";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "U");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "R"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 2);
}

@test:Config
function testPickUpNegotiationSuccess8() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "R";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "T");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "R"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 2);
}


@test:Config
function testPickUpNegotiationSuccess9() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "T";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "S");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "T"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 2);
}

@test:Config
function testPickUpNegotiationSuccess10() returns error? {
    string _name = uuid:createType1AsString();
    shuttle:nextShuttleLocation = "U";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[] res = check negotiatePickUp("ws://localhost:9094/shuttle", _name, "S");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertEquals(res, ["V", "U"]);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertFalse(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 2);
}

@test:Config
function testPickUpNegotiationFailure() {
    shuttle:nextShuttleLocation = "S";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", "jo", "R");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, "jo");
    test:assertTrue(res is error);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertTrue(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationFailure2() {
    string _name = "paul";
    shuttle:nextShuttleLocation = "U";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", _name, "T");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertTrue(res is error);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertTrue(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationFailure3() {
    string _name = "fred";
    shuttle:nextShuttleLocation = "V";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", _name, "S");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertTrue(res is error);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertTrue(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}

@test:Config
function testPickUpNegotiationFailure4() {
    string _name = "xhon";
    shuttle:nextShuttleLocation = "V";
    string[] prevKeys = shuttle:pickUpRequests.keys();
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", _name, "U");
    string[] newKeys = shuttle:pickUpRequests.keys();
    test:assertEquals(newKeys.length() - 1, prevKeys.length());
    string name = newKeys.pop();
    test:assertEquals(name, _name);
    test:assertTrue(res is error);
    [websocket:Caller?, string[]] [currentCaller, desiredPickUpLocations] = shuttle:pickUpRequests.get(name);
    test:assertTrue(currentCaller is ());
    test:assertEquals(desiredPickUpLocations.length(), 1);
}


@test:Config
function testPickUpNegotiationFailure5() {
    string _name = "xdshon";
    shuttle:nextShuttleLocation = "Q";
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", _name, "Q");
    test:assertTrue(res is error);
}

@test:Config
function testPickUpNegotiationFailure6() {
    string _name = "xdshon";
    shuttle:nextShuttleLocation = "W";
    Location[]|error res = negotiatePickUp("ws://localhost:9094/shuttle", _name, "W");
    test:assertTrue(res is error);
}