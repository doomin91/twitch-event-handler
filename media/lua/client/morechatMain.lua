Events.OnGameBoot.Add(print("------------=Twitch Events: alpha v0.0.1=------------"))

local myevents = require("morechatEvents")
local MyEventsTable = {}

function getreward()
    local ReadReward = getFileReader("rewards.txt", true)
    json_string = ReadReward:readLine()
    ReadReward:close()
    if json_string ~= nil then
        print(json_string)

        t=json_string:split("||")
        for k, v in pairs(t) do
            print(v)
        end

        MyEventsTable = {
            ["viewer"] = "dominic",
            ["zombies"] = "false",
            ["zedquant"] = "1",
            ["helicopter"] = "1"
        }
        local EmptyRewardFile = getFileWriter("rewards.txt", false, false)
        EmptyRewardFile:write("")
        EmptyRewardFile:close()
		processEvent(MyEventsTable)
    else
    end
    -- if json_string ~= nil then
    --     local viewer = json_string:match('"Viewer": "(.-)",')
    --     local status = json_string:match('"Status": "(.-)",')
    --     local title = json_string:match('"title": "(.-)",')
    --     local zombies = json_string:match('"zombies": (.-),')
    --     local zedquant = json_string:match('"zedquant": (.-),')
    --     local gifts = json_string:match('"gifts": (.-),')
	-- 	local helicopter = json_string:match('"helicopter": (.-),')
	-- 	local gas = json_string:match('"gas": (.-),')
	-- 	local tire = json_string:match('"tire": (.-),')
	-- 	local muffler = json_string:match('"muffler": (.-),')
	-- 	local battery = json_string:match('"battery": (.-),')
	-- 	local engine = json_string:match('"engine": (.-),')
    --     local trait = json_string:match('"trait": (.-)}')
    --     MyEventsTable = {
    --         ["viewer"] = viewer,
    --         ["status"] = status,
    --         ["title"] = title,
    --         ["zombies"] = zombies,
    --         ["zedquant"] = zedquant,
    --         ["gifts"] = gifts,
    --         ["helicopter"] = helicopter,
	-- 		["gas"] = gas,
	-- 		["tire"] = tire,
	-- 		["muffler"] = muffler,
	-- 		["battery"] = battery,
	-- 		["engine"] = engine,
	-- 		["trait"] = trait,
    --     }
    --     local EmptyRewardFile = getFileWriter("rewards.txt", false, false)
    --     EmptyRewardFile:write("")
    --     EmptyRewardFile:close()
	-- 	processEvent(MyEventsTable)
    -- else
    -- end
end

function string:split(delimiter)
    local result = { }
    local from = 1
    local delim_from, delim_to = string.find( self, delimiter, from )
    while delim_from do
        table.insert( result, string.sub( self, from , delim_from-1 ) )
        from = delim_to + 1
        delim_from, delim_to = string.find( self, delimiter, from )
    end
    table.insert( result, string.sub( self, from ) )
    return result
end

Events.EveryOneMinute.Add(getreward)
