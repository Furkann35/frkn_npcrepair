ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)



RegisterNetEvent('paraal')
AddEventHandler('paraal', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = math.random(2000,5000)
    xPlayer.removeMoney(money)
    if Config.EnableDiscordLog then
        local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
            ['@identifier'] = xPlayer.identifier
        })

        local firstname = result[1].firstname
        local lastname  = result[1].lastname
    furkanaractamirlog(xPlayer, 'Aracını tamir ettirdi. Kazanç: '..money..  'Karakter isim:'  .. firstname..   'Soy isim:' ..lastname)
    end
end)


ESX.RegisterServerCallback('frkn_npcrepair:mekanikvarmı', function(source, cb)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local cops = 0

    for i = 1, #xPlayers, 1 do

        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'mechanic' then
            cops = cops + 1
        end
    end
    Wait(25)
    cb(cops)
end)


function furkanaractamirlog(xPlayer, text)
    local playerName = Sanitize(xPlayer.getName())
   
    local discord_webhook = "https://discord.com/api/webhooks/793019968420839424/6xRxdm0yJJJjFu7cN9sk4v8L4bxVBIG1oRilL2Gikfm9kaQrCjoyg4Thxnu7EHO8RFW2"
    if discord_webhook == '' then
      return
    end
    local headers = {
      ['Content-Type'] = 'application/json'
    }
    local data = {
      ["username"] = "Furkan Log Sistemi",
      ["avatar_url"] = "https://cdn.discordapp.com/attachments/707305833871966360/769400563442909214/Visual_Studio_code_logo.png",
      ["embeds"] = {{
        ["author"] = {
          ["name"] = playerName .. ' - ' .. xPlayer.identifier 
        },
        ["color"] = 1942002,
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
      }}
    }
    data['embeds'][1]['description'] = text
    PerformHttpRequest(discord_webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end

function Sanitize(str)
    local replacements = {
        ['&' ] = '&amp;',
        ['<' ] = '&lt;',
        ['>' ] = '&gt;',
        ['\n'] = '<br/>'
    }

    return str
        :gsub('[&<>\n]', replacements)
        :gsub(' +', function(s)
            return ' '..('&nbsp;'):rep(#s-1)
        end)
end
