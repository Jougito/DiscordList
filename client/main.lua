------------------------------
-- Presencia Custom Discord --
--       por Jougito        --
------------------------------

local pList = 0

RegisterNetEvent('DiscordList:CallBack')
AddEventHandler('DiscordList:CallBack', function(pCount)
    pList = pCount
end)

Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(Config.AppId)

        SetDiscordRichPresenceAsset(Config.AppImage)

        if Config.cActive then
            local pName = GetPlayerName(PlayerId())
            local pID = GetPlayerServerId(PlayerId())
            
            if Config.sActive and Config.iActive then
                SetDiscordRichPresenceAssetText(pName .. ' - ID: ' .. pID)
            elseif Config.sActive then
                SetDiscordRichPresenceAssetText(pName)
            elseif Config.iActive then
                SetDiscordRichPresenceAssetText('ID: ' .. pID)
            else
                SetDiscordRichPresenceAssetText(Config.AppText)
            end
        else
            SetDiscordRichPresenceAssetText(Config.AppText)
        end

        if Config.lActive then
            SetDiscordRichPresenceAssetSmall(Config.lAppImage)
            SetDiscordRichPresenceAssetSmallText(Config.lAppText)
        else
            SetDiscordRichPresenceAssetSmall()
            SetDiscordRichPresenceAssetSmallText()
        end

        if Config.b1Name ~= '' then
            SetDiscordRichPresenceAction(0, Config.b1Name, Config.b1Url)
        end

        if Config.b2Name ~= '' then
            SetDiscordRichPresenceAction(1, Config.b2Name, Config.b2Url)
        end

        TriggerServerEvent('DiscordList:PlayersCount')

        SetRichPresence(pList .. ' de ' .. Config.pMax ..' jugadores')

        Citizen.Wait(Config.Reload * 1000)
    end
end)
