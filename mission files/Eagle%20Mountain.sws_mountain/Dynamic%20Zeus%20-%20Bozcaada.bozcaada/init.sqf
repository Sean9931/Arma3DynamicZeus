// For Zeus to see every unit upon start of game
if (isServer) then { 
    { 
        _x addCuratorEditableObjects [allUnits,true]; 
        _x addCuratorEditableObjects [vehicles,true]; 
        _x removeCuratorEditableObjects [allMissionObjects "Static",true];
    } forEach allCurators;             
};