------------------------------
-- Presencia Custom Discord --
--       por Jougito        --
------------------------------

local nChecks = 0

-- Config Check

if Config.AppId == nil or Config.AppId == '' then
    print('^6[DiscordList] ^5App ID^0 is ^8not^0 be set')
    nChecks = nChecks + 1 
end

if Config.AppImage == nil or Config.AppImage == '' then
    print('^6[DiscordList] ^5App Image^0 is ^8not^0 be set')
    nChecks = nChecks + 1
end

if Config.AppText  == nil or Config.AppText == '' then
    print('^6[DiscordList] ^5App Text^0 is ^8not^0 be set')
    nChecks = nChecks + 1
end

if Config.lActive and (Config.lAppImage == nil or Config.lAppImage == '') then
    print('^6[DiscordList] ^5App Small Image^0 is ^8not^0 be set')
    nChecks = nChecks + 1
end

if Config.b1Name ~= '' then
    if Config.b1Url == nil or Config.b1Url == '' then
        print('^6[DiscordList] ^5Button 1 URL^0 is ^8not^0 be set')
        nChecks = nChecks + 1
    end
end

if Config.b2Name ~= '' then
    if Config.b2Url == nil or Config.b2Url == '' then
        print('^6[DiscordList] ^5Button 2 URL^0 is ^8not^0 be set')
        nChecks = nChecks + 1
    end
end

if nChecks == 0 then
    print('^6[DiscordList]^0 All checks ^2have passed^0 successfully')
else
    if nChecks == 1 then
        print('^0')
        print('^6[DiscordList]^0 One check ^8has not passed^0 successfully')
    elseif nChecks > 1 then
        print('^0')
        print('^6[DiscordList]^0 ' .. nChecks .. ' checks ^8have not passed^0 successfully')
    end
end

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0.1'
local GithubResourceName = 'DiscordList'

PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
    PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/CHANGELOG', function(Error, Changes, Header)
        print('^0')
        print('^6[DiscordList]^0 Checking for updates...')
        print('^0')
        print('^6[DiscordList]^0 Current version: ^5' .. CurrentVersion .. '^0')
        print('^6[DiscordList]^0 Updater version: ^5' .. NewestVersion .. '^0')
        print('^0')
        if CurrentVersion ~= NewestVersion then
            print('^6[DiscordList]^0 Your script is ^8outdated^0!')
            print('^0')
            print('^6[DiscordList] ^3CHANGELOG ^5' .. NewestVersion .. ':^0')
            print('^3')
            print(Changes)
            print('^0')
            print('^6[DiscordList]^0 You ^8are not^0 running the newest stable version of ^5DiscordList^0. Please update: https://github.com/Jougito/DiscordList')
        else
            print('^6[DiscordList]^0 Your script is ^2up to update^0')
        end
        print('^0')
    end)
end)
