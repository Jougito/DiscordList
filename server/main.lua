------------------------------
-- Presencia Custom Discord --
--       por Jougito        --
------------------------------

local check = 1

-- Config Check

if Config.AppId == nil or Config.AppId == '' then
    print('^6[DiscordList] ^5App ID^0 is ^8not^0 be set')
    check = 0
    
end

if Config.AppImage == nil or Config.AppImage == '' then
    print('^6[DiscordList] ^5App Image^0 is ^8not^0 be set')
    check = 0
end

if Config.AppText  == nil or Config.AppText == '' then
    print('^6[DiscordList] ^5App Text^0 is ^8not^0 be set')
    check = 0
end

if Config.lActive and (Config.lAppImage == nil or Config.lAppImage == '') then
    print('^6[DiscordList] ^5App Small Image^0 is ^8not^0 be set')
    check = 0
end

if check == 1 then
    print('^6[DiscordList]^0 All checks have ^2passed successfully^0')
else
    print('^6[DiscordList]^0 One or more checks have ^8not passed successfully^0')
end

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0.0'
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
