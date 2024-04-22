function TheAddon_OnLoad()
end

function TheAddon_OnUpdate(self, elapsed)
end

local function theAddonFilter(self, event, mesg, author, ...)
  if strfind(mesg, "\124H") then return false end
  mesg = messageReplaceFilter(":%w+:", mesg)
  return false, mesg, author, ...
end

function messageReplaceFilter(match, mesg)
  for emote in string.gmatch(mesg, match) do
    emote = emote.gsub(emote, ":", "")
    if (Emotedata[emote]) then
      mesg = mesg.gsub(mesg, ":" .. emote .. ":", showEmote(emote))
    end
  end
  return mesg
end

function showEmote(emoticon)
    local emoteMeta = Emotedata[emoticon]

    return "\124TInterface\\AddOns\\TheAddon2go\\Textures\\" .. emoteMeta.Texture .. ":" .. emoteMeta.Height .. ":" .. emoteMeta.Width .. ":0:0\124t"
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",             theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",                 theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",                theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",             theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM",        theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER",        theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM",        theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_CONVERSATION",        theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",               theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER",             theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY",               theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID",                theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING",             theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER",         theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND",        theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", theAddonFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT",        theAddonFilter)