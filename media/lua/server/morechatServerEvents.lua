--/////////////////////////////////////////////////////////////////////////
--//////////////////////// Snippet Code by Dislaik ////////////////////////
--/////////////////////////////////////////////////////////////////////////

local Commands = {};
Commands.TWEEvents = {};


Commands.TWEEvents.Test = function(source, args)
    local sourceId = source:getOnlineID();
    local Etype = args.Etype;
    print("player ID [".. sourceId .."] send: ".. Etype)
end

Commands.TWEEvents.Zedspawn = function(source, args)
    local sourceId = source:getOnlineID();
    local ZedQ = tonumber(args.ZedQ);
	print("Zedspawn [".. sourceId .."] quant: ", ZedQ)
	print("Zedspawn [".. sourceId .."] XY: ", args.ZedX,args.ZedY)
	print("Zedspawn [".. sourceId .."] PlayerXY: ", source:getX(),source:getY())
	createHordeFromTo(args.ZedX, args.ZedY, source:getX(), source:getY(), args.ZedQ)
end


Commands.TWEEvents.AirEvent = function(source, args)
    local sourceId = source:getOnlineID();
	print("player ID [".. sourceId .."] TWEvent: ".. args.Etype)
	local heli = getFreeHelicopter(args.heli)
	heli:launch(source, false)
end

local onClientCommand = function(module, command, source, args) -- Events Constructor.
    if Commands[module] and Commands[module][command] then
	    Commands[module][command](source, args);
    end
end


--/////////////////////////////////////////////////////////////////////////
--//////////////////////// Snippet Code by Dislaik ////////////////////////
--/////////////////////////////////////////////////////////////////////////


Events.OnClientCommand.Add(onClientCommand); -- Listening Events from Client side.