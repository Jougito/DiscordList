------------------------------
-- Presencia Custom Discord --
--       por Jougito        --
------------------------------

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

        local pList = #GetActivePlayers()
        SetRichPresence(pList .. ' de ' .. Config.pMax ..' jugadores')

        Citizen.Wait(Config.Reload * 1000)
    end
end)
