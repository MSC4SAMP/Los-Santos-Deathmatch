// ------------------------------------------------------------------------- //
//                      Los Santos Deathmatch v0.1                           //
//                        Developed by: MSC.                                 //
// Thanks to Kush, Y_Less, Emmet_., SA:MP Team, Dracoblue, Zeex and Yashas   //
// ------------------------------------------------------------------------- //
	  // Saving system from Kush's Register 'n' login system tutorial //
/* --------------------------- [ To do list: ] ----------------------------- //

- Finish the Admin system [%100] // Finished.
- Add 3 different Jobs [%0] // To be added in the next update.
- Optimaze the script [%0] 
- Weapons / Skins Shop [%100]

// ------------------------------------------------------------------------- */
#include <a_samp> // Thanks to SA:MP Team
#include <YSI\y_ini> // Thanks to Y_Less
#include <sscanf2> // Thanks to Y_Less & Emmet_.
#include <izcmd> // Thanks to Zeex & Yashas

// ------------------------------------------------------------------------- //

#define DRegister 1
#define DLogin 2
#define DRSuccess 3
#define DLSuccess 4
#define DHelp 5
#define DRules 6
#define DCmds 7
#define DUpdates 8
#define DCredits 9
#define DWeb 10
#define DAhelp 11
#define DShop 12

// ------------------------------------------------------------------------- //

#define PATH "/Data/%s.ini"

// ------------------------------------------------------------------------- //

#define DWhite "{FFFFFF}"
#define DRed "{F81414}"
#define TGrey 0xAFAFAFAA
#define TGreen 0x33AA33AA
#define TRed 0xAA3333AA
#define TYellow 0xFFFF00AA

// ------------------------------------------------------------------------- //
 

enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
	pScore,
	pSkin
	
}
new PlayerInfo[MAX_PLAYERS][pInfo];
new Ironbars1[MAX_PLAYERS], Ironbars2[MAX_PLAYERS], Ironbars3[MAX_PLAYERS], Ironbars4[MAX_PLAYERS], Jailed[MAX_PLAYERS]; // Jail system.

forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Score",PlayerInfo[playerid][pScore]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    return 1;
}

main()
{
	print("[SERVER]: Loading...");
	print("[SERVER]: Loading...");
	print("[SERVER]: Loading...");
	print("[SERVER]: Successfully loaded your gamemode!");
}

public OnGameModeInit()
{
	SetGameModeText("Los Santos Deathmatch v0.1");
	AddPlayerClass(1,2507.9558,-1670.9633,13.3790,86.9892,0,0,0,0,0,0);
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	AddStaticVehicle(534,2453.3999000,-1662.4000000,13.1000000,90.0000000,156,161);
	AddStaticVehicle(534,2443.3999000,-1662.4000000,13.1000000,90.0000000,156,161);
	AddStaticVehicle(534,2427.8999000,-1662.3000000,13.2000000,90.0000000,156,161);
	AddStaticVehicle(534,2435.6001000,-1662.4000000,13.2000000,90.0000000,156,161);
	AddStaticVehicle(576,2406.2000000,-1655.5000000,13.1000000,90.0000000,153,78);
	AddStaticVehicle(576,2398.7000000,-1655.3000000,13.1000000,90.0000000,153,78);
	AddStaticVehicle(576,2391.5000000,-1655.3000000,13.1000000,90.0000000,153,78);
	AddStaticVehicle(576,2412.8000000,-1655.6000000,13.1000000,90.0000000,153,78);
	AddStaticVehicle(426,2291.8999000,-1680.1000000,13.9000000,0.0000000,124,28);
	AddStaticVehicle(412,2303.3999000,-1637.7000000,14.5000000,0.0000000,66,31);
	AddStaticVehicle(401,2186.6001000,-1668.4000000,14.4000000,0.0000000,57,90);
	AddStaticVehicle(533,2181.6001000,-1700.9000000,13.3000000,0.0000000,30,46);
	AddStaticVehicle(534,2121.3000000,-1780.3000000,13.2000000,0.0000000,101,106);
	AddStaticVehicle(547,2116.7000000,-1780.3000000,13.2000000,0.0000000,70,89);
	AddStaticVehicle(448,2110.5000000,-1783.7000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2109.1001000,-1783.5000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2107.8000000,-1783.5000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2106.4004000,-1783.4004000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2105.2002000,-1783.5000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2103.7000000,-1783.5000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2102.2000000,-1783.6000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(448,2100.6001000,-1783.5000000,13.1000000,0.0000000,132,4);
	AddStaticVehicle(463,2069.3000000,-1919.7000000,13.2000000,0.0000000,101,106);
	AddStaticVehicle(486,2056.0000000,-1940.8000000,13.7000000,90.0000000,245,245);
	AddStaticVehicle(451,2065.5000000,-1919.7000000,13.3000000,0.0000000,27,55);
	AddStaticVehicle(603,2055.8000000,-1904.7000000,13.5000000,0.0000000,109,24);
	AddStaticVehicle(549,2131.5000000,-1908.7000000,13.2000000,0.0000000,88,88);
	AddStaticVehicle(549,2131.3999000,-1917.8000000,13.2000000,0.0000000,88,88);
	AddStaticVehicle(529,2077.0000000,-1698.5000000,13.1000000,0.0000000,101,106);
	AddStaticVehicle(466,2077.6001000,-1736.1000000,13.3000000,0.0000000,51,95);
	AddStaticVehicle(574,2186.9004000,-1991.4004000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2189.2998000,-1991.2002000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2184.7002000,-1986.2998000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2186.7000000,-1986.4000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2189.2000000,-1986.5000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2189.0000000,-1982.5000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2186.6001000,-1982.1000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2184.2002000,-1982.0000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(574,2184.3999000,-1991.5000000,13.3000000,0.0000000,165,169);
	AddStaticVehicle(487,1961.1000000,-2341.1001000,13.8000000,0.0000000,151,149);
	AddStaticVehicle(487,1939.2000000,-2341.2000000,13.8000000,0.0000000,151,149);
	AddStaticVehicle(487,1950.5000000,-2371.2000000,13.8000000,0.0000000,151,149);
	AddStaticVehicle(488,1856.7000000,-2404.3999000,13.8000000,0.0000000,42,119);
	AddStaticVehicle(553,1977.5000000,-2631.2000000,15.8000000,0.0000000,77,132);
	AddStaticVehicle(553,1945.3000000,-2629.7000000,15.8000000,0.0000000,77,132);
	AddStaticVehicle(577,1894.3000000,-2492.1001000,12.5000000,90.0000000,34,25);
	AddStaticVehicle(420,1784.4000000,-1932.4000000,13.2000000,0.0000000,215,142);
	AddStaticVehicle(420,1789.2000000,-1932.0000000,13.2000000,0.0000000,215,142);
	AddStaticVehicle(420,1793.7000000,-1931.9000000,13.2000000,0.0000000,215,142);
	AddStaticVehicle(420,1798.3000000,-1932.0000000,13.2000000,0.0000000,215,142);
	AddStaticVehicle(420,1803.3000000,-1931.9000000,13.2000000,0.0000000,215,142);
	AddStaticVehicle(580,1778.5000000,-1891.4000000,13.3000000,0.0000000,95,10);
	AddStaticVehicle(458,1834.7000000,-1870.8000000,13.4000000,0.0000000,37,37);
	AddStaticVehicle(434,1844.2000000,-1871.3000000,13.5000000,0.0000000,215,142);
	AddStaticVehicle(416,2000.5000000,-1413.9000000,17.3000000,180.0000000,245,245);
	AddStaticVehicle(416,2004.2000000,-1455.9000000,13.9000000,90.0000000,245,245);
	AddStaticVehicle(416,2032.6000000,-1437.1000000,17.5000000,0.0000000,245,245);
	AddStaticVehicle(481,1887.2000000,-1399.0000000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(481,1889.9004000,-1395.5000000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(481,1891.9000000,-1392.0000000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(481,1892.9004000,-1388.5000000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(481,1895.2002000,-1383.7002000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(481,1896.7000000,-1380.2000000,13.2000000,0.0000000,214,218);
	AddStaticVehicle(407,1748.9000000,-1455.4000000,13.9000000,270.0000000,132,4);
	AddStaticVehicle(596,1559.2998000,-1611.0996000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(596,1562.7002000,-1611.0000000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(596,1566.2000000,-1611.7000000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(596,1569.9004000,-1611.9004000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(596,1555.6000000,-1611.1000000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(596,1552.1000000,-1611.1000000,13.2000000,0.0000000,-1,-1);
	AddStaticVehicle(601,1535.5000000,-1667.0000000,13.3000000,0.0000000,245,245);
	AddStaticVehicle(601,1535.0996000,-1675.2002000,13.3000000,0.0000000,245,245);
	AddStaticVehicle(416,1180.4000000,-1339.2000000,14.1000000,90.0000000,245,245);
	AddStaticVehicle(416,1178.3000000,-1309.7000000,14.1000000,90.0000000,245,245);
	AddStaticVehicle(402,1210.8000000,-1378.9000000,13.2000000,0.0000000,66,31);
	AddStaticVehicle(560,1693.7000000,-1612.1000000,13.2000000,0.0000000,115,46);
	AddStaticVehicle(439,1685.7000000,-1677.7000000,13.4000000,0.0000000,189,190);
	AddStaticVehicle(409,1790.0000000,-1811.0000000,13.5000000,90.0000000,245,245);
	CreateObject(1344,2482.1001000,-1650.2000000,13.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1299,2497.3000000,-1673.6000000,12.8000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1221,2498.8999000,-1676.5000000,12.8000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1220,2497.2000000,-1675.7000000,12.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1221,2496.2000000,-1677.6000000,12.8000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1221,2498.8000000,-1676.5000000,13.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1220,2496.1001000,-1677.6000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1221,2499.0000000,-1675.4000000,12.8000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3594,2503.2000000,-1668.6000000,13.0000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3593,2496.8999000,-1667.3000000,13.1000000,0.0000000,0.0000000,60.0000000);
	CreateObject(3221,2495.1001000,-1670.1000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3350,2486.1001000,-1656.6000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3533,2465.1001000,-1665.9000000,16.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3533,2466.5000000,-1651.5000000,16.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(14537,2482.5000000,-1667.3000000,14.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1825,2474.7000000,-1659.9000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1825,2473.0000000,-1663.4000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1825,2473.1001000,-1667.0000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1825,2474.5000000,-1670.3000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1825,2476.3000000,-1674.3000000,12.3000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1364,2480.6001000,-1655.8000000,13.1000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1364,2474.6001000,-1655.6000000,13.1000000,0.0000000,0.0000000,0.0000000);
	CreateObject(851,2499.1001000,-1680.9000000,12.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(3035,2465.0000000,-1662.2000000,13.1000000,0.0000000,0.0000000,90.0000000);
	CreateObject(3035,2464.8000000,-1659.2000000,13.1000000,0.0000000,0.0000000,90.0000000);
	CreateObject(3035,2465.1001000,-1655.8000000,13.1000000,0.0000000,0.0000000,90.0000000);
	CreateObject(1347,2495.2000000,-1675.1000000,12.9000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1550,2487.0000000,-1666.6000000,13.9000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1550,2486.8999000,-1667.8000000,13.9000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1550,2487.8999000,-1667.8000000,13.9000000,0.0000000,0.0000000,0.0000000);
	CreateObject(2035,2487.0000000,-1664.0000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(2044,2487.0000000,-1663.5000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(2710,2484.8593800,-1664.8418000,12.5147500,0.0000000,0.0000000,0.0000000);
	CreateObject(2710,2484.8999000,-1671.8000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(2710,2485.3000000,-1671.8000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(2710,2485.7000000,-1671.8000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1486,2484.5000000,-1671.8000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1520,2486.0000000,-1671.9000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1517,2486.3000000,-1672.0000000,13.7000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1543,2486.5000000,-1672.0000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1544,2486.6001000,-1671.8000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1544,2486.7000000,-1672.0000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1546,2486.8999000,-1669.7000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1668,2487.0000000,-1671.1000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1667,2487.1001000,-1670.7000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1669,2486.7000000,-1669.9000000,13.6000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1748,2483.5000000,-1671.7000000,13.5000000,0.0000000,0.0000000,0.0000000);
	CreateObject(1720,2483.3000000,-1674.0000000,12.3000000,0.0000000,0.0000000,160.0000000);
	CreateObject(3819,2484.8999000,-1679.4000000,13.3000000,0.0000000,0.0000000,270.0000000);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 2507.9558,-1670.9633,13.3790);
	SetPlayerCameraPos(playerid, 2507.9558,-1670.9633,13.3790);
	SetPlayerCameraLookAt(playerid, 2502.1716,-1670.2261,13.3584);
	return 1;
}

public OnPlayerConnect(playerid)
{
    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DLogin, DIALOG_STYLE_PASSWORD,""DWhite"Login",""DWhite"Type your password below to login.","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DRegister, DIALOG_STYLE_PASSWORD,""DWhite"Registering...",""DWhite"Type your password below to register a new account.","Register","Quit");
    }
    new pname[MAX_PLAYER_NAME], string[128];
    GetPlayerName(playerid, pname, sizeof(pname));
    format(string, sizeof(string), "[SERVER]: %s has joined the server.", pname);
	SendClientMessageToAll(TYellow, string);
	SetPlayerColor(playerid, -1);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new INI:File = INI_Open(UserPath(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File,"Cash",GetPlayerMoney(playerid));
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
    INI_WriteInt(File,"Score",GetPlayerScore(playerid));
    INI_WriteInt(File,"Skin",GetPlayerSkin(playerid));
    INI_Close(File);
    new pname[MAX_PLAYER_NAME], string[128];
	format(string, sizeof(string),"[SERVER]: %s has left the server.", pname);
	SendClientMessageToAll(TGrey, string);

    return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{

    PlayerInfo[killerid][pKills]++;
    PlayerInfo[playerid][pDeaths]++;
    PlayerInfo[killerid][pScore]++;
	if(GetPlayerMoney(playerid) < 500)
	{
	  SendClientMessage(playerid, TRed, "[SERVER]: You didn't have $100 to fix your wounds, get some money junkie.");
	}
	else if(GetPlayerMoney(playerid) > 500)
	{
      SendClientMessage(playerid, TRed, "[SERVER]: You died and paid $100 to fix your wounds.");
	}
	new pname[MAX_PLAYER_NAME], ename[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(killerid, ename, sizeof(ename));
	format(string, sizeof(string), "[SERVER]: You killed %s and looted $1,000 from him (+ 1 Score).", pname);
	SendClientMessage(killerid, TGreen, string);
	format(string, sizeof(string), "[SERVER]: You have been killed by %s!", ename);
	SendClientMessage(playerid, TRed, string);
	GivePlayerMoney(killerid, 1000);
	GivePlayerMoney(playerid, -500);
    GameTextForPlayer(playerid, "You have been killed by %s", 5000, 2);
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

CMD:help(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));		
	format(string, sizeof(string),"[COMMAND]: %s used /help", pname);
	print(string);
	ShowPlayerDialog(playerid, DHelp, DIALOG_STYLE_MSGBOX, DRed"Player help:", DWhite"- Welcome to Los Santos Deathmatch playa' and welcome to help section as well.\n- Okay buddy. Here i will show you everything about the server so pay attention.\n- You can buy weapons & skins from /shop & /buyskin.\n- You can't buy vehicles here. Steal one from the street.\n- You can earn money by deathmatching or doing jobs around Los Santos.", "Close","");
	return 1;
}
CMD:rules(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(string, sizeof(string),"[COMMAND]: %s used /rules", pname);
	print(string);
	ShowPlayerDialog(playerid, DRules, DIALOG_STYLE_LIST, DRed"Player rules:", DWhite"- Do not use any cheats.\n- Do not spam, flood or insult.\n- Do not advertise any servers or websites.\n- Do not quit to avoid death.\n- Do not do /q jokes.\n- Do not ban evade.\n- Do not bug abuse.", "Close","");
	return 1;
}
CMD:commands(playerid, params[])	
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(string, sizeof(string),"[COMMAND]: %s used /commands", pname);
	print(string);
	ShowPlayerDialog(playerid, DCmds, DIALOG_STYLE_MSGBOX, DRed"Player commands:", DWhite"- /help, /rules, /commands, /updates, /credits, /web /repair, /stuck, /kill, /fixvw, /buyskin, /shop ", "Close","");
	return 1;
}
CMD:stuck(playerid, params[])	
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	SendClientMessage(playerid, TGreen, "[SERVER]: You're not stuck anymore.");
	ClearAnimations(playerid);
	format(string, sizeof(string),"[COMMAND]: %s used /stuck", pname);
	print(string);
	return 1;
}
CMD:repair(playerid, params[])	
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be in a vehicle!");
	RepairVehicle(playerid);
	SendClientMessage(playerid, TGreen, "[SERVER]: You succesfully fixed your vehicle.");
	format(string, sizeof(string),"[COMMAND]: %s used /repair", pname);
	print(string);
	return 1;
}
CMD:fixvw(playerid, params[])	
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	if(GetPlayerVirtualWorld(playerid) == 0) return SendClientMessage(playerid, TRed, "[SERVER]: Your virtual world is already fixed!");
	SendClientMessage(playerid, TGreen, "[SERVER]: You successfully fixed your virtual world.");
	format(string, sizeof(string),"[COMMAND]: %s used /fixvw", pname);
	print(string);
	return 1;
}
CMD:kill(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	SetPlayerHealth(playerid, 0.0);
	PlayerInfo[playerid][pDeaths]++;
	SendClientMessage(playerid, TYellow, "[SERVER]: You just died...");
	format(string, sizeof(string),"[COMMAND]: %s used /kill", pname);
	print(string);
	return 1;
}
CMD:stats(playerid, params[]) // Bugged, tried fixing it but i failed.
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(string, sizeof(string),"| Kills: %d | Deaths: %d | Money: %d | Score: %d | Skin ID: %d |", PlayerInfo[playerid][pKills], PlayerInfo[playerid][pDeaths], PlayerInfo[playerid][pCash], PlayerInfo[playerid][pScore], PlayerInfo[playerid][pSkin]);
	SendClientMessage(playerid, TGrey, string);
	format(string, sizeof(string),"[COMMAND]: %s used /stats", pname);
	print(string);
	return 1;
}
CMD:updates(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	ShowPlayerDialog(playerid, DUpdates, DIALOG_STYLE_MSGBOX, DRed"Server updates:", DWhite"- Last Updates: 'Nothing'", "Close", "");
	format(string, sizeof(string),"[COMMAND]: %s used /updates", pname);
	return 1;
}
CMD:credits(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	ShowPlayerDialog(playerid, DCredits, DIALOG_STYLE_MSGBOX, DRed"Server credits:", DWhite"- This server has been developed by MSC (Change me).", "Close","");
	format(string, sizeof(string),"[COMMAND]: %s used /credits", pname);
	return 1;
}
CMD:web(playerid, params[])	
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));	
	ShowPlayerDialog(playerid, DWeb, DIALOG_STYLE_MSGBOX, DRed"Server website:", DWhite"- Website: -", "Close", "");
	format(string, sizeof(string),"[COMMAND]: %s used /web", pname);
	return 1;
}
CMD:shop(playerid, params[])
{
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	ShowPlayerDialog(playerid, DShop, DIALOG_STYLE_LIST, DRed"Server shop:", DWhite"- Body Armour [$1,000]\n- Desert Eagle [$2,500]\n- Shotgun [$3,000]\n- M4 [$5,000]\n- Sniper rifle [$10,000]", "Select", "Close");
    format(string, sizeof(string), "[COMMAND]: %s used /shop", pname);
    print(string);
    return 1;
}
CMD:buyskin(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], string[128], skinid;
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(GetPlayerMoney(playerid) < 100000) return SendClientMessage(playerid, TRed, "[SERVER]: You must have $100,000!");
	if(sscanf (params, "i", skinid)) return SendClientMessage(playerid, TRed, "Usage: /buyskin <ID>");
	if(0 > skinid > 311) return SendClientMessage(playerid, TRed, "[SERVER]: Skin ID must be between 0 & 311.");
	SetPlayerSkin(playerid, skinid);
    PlayerInfo[playerid][pSkin] = skinid;
	GetPlayerName(playerid, pname, sizeof(pname));
    format(string, sizeof(string), "[COMMAND]: %s used /buyskin", pname);
    print(string);
    return 1;
}


	// -------------------------[ Admin Section ]: -------------------------------- //

	// -------------------------[ All Admins ]: -------------------------------- //

CMD:ahelp(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	ShowPlayerDialog(playerid, DAhelp, DIALOG_STYLE_MSGBOX, DRed"Server Admin help:", "- Admin level 1: /setskin, /sethealth, /setarmour, /agiveweapon, /agoto, /aget, /explode, /akill, /setvw, /ajail, /aunjail\n- Admin level 2: /agivecash, /asetscore, /kick, /ban, /skick, /sban, /getstats, /write, /freeze, /unfreeze, /spec, /unspec, ann\n- Admin level 3: - To be added - ", "Close","");
    format(string, sizeof(string), "[COMMAND]: Admin %s used /ahelp", pname);
    print(string);
    return 1;
}

	// -------------------------[ RCON Admin ]: -------------------------------- //

CMD:setadmin(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, alevel;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, alevel)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /setadmin <ID> <Level>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	if(alevel > 3) return SendClientMessage(playerid, TRed, "[SERVER]: Max level is 3.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your level to %d!", pname, alevel);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's level to %d", tname, alevel);
	SendClientMessage(playerid, TYellow, string);
	PlayerInfo[tplayer][pAdmin] = alevel;
    format(string, sizeof(string),"[COMMAND]: Admin %s used /setadmin", pname);
    print(string);
	return 1;
}

	// -------------------------[ Admin level 1 ]: -------------------------------- //

CMD:setskin(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, skinid;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, skinid)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /setskin <ID> <Skin ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	if(0 > skinid > 311) return SendClientMessage(playerid, TRed, "[SERVER]: Skin ID must be between 0 & 311.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your skin to %d!", pname, skinid);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's skin to %d", tname, skinid);
	SendClientMessage(playerid, TYellow, string);
	SetPlayerSkin(tplayer, skinid);
	PlayerInfo[tplayer][pSkin] = skinid;
    format(string, sizeof(string),"[COMMAND]: Admin %s used /setskin", pname);
    print(string);
	return 1;
}
CMD:agiveweapon(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, weaponid;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, weaponid)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /agiveweapon <ID> <Weapon ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
  	if(0 > weaponid > 46) return SendClientMessage(playerid, TRed, "[SERVER]: Weapon ID must be between 0 & 46.");
	format(string, sizeof(string), "[ADMIN]: Admin %s gave you a weapon, ID: %d!", pname, weaponid);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You gave %s a weapon, ID: %d", tname, weaponid);
	SendClientMessage(playerid, TYellow, string);
	GivePlayerWeapon(tplayer, weaponid, 99999);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /agiveweapon", pname);
    print(string);
	return 1;
}
CMD:sethealth(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, Float:health;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, health)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /sethealth <ID> <Amount>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your health to: %d!", pname, health);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's health to: %d", tname, health);
	SendClientMessage(playerid, TYellow, string);
	SetPlayerHealth(tplayer, health);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /sethealth", pname);
    print(string);
	return 1;
}
CMD:setarmour(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, armour;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, armour)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /setarmour <ID> <Amount>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your armour to: %d!", pname, armour);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's armour to: %d", tname, armour);
	SendClientMessage(playerid, TYellow, string);
	SetPlayerArmour(tplayer, armour);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /setarmour", pname);
    print(string);
	return 1;
}
CMD:akill(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /akill <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	SetPlayerHealth(tplayer, 0);
	PlayerInfo[tplayer][pDeaths]++;
	format(string, sizeof(string), "[ADMIN]: Admin %s killed you.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully killed %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /akill.");
	print(string);
	return 1;
}
CMD:explode(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, Float:x, Float:y, Float:z;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /explode <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	GetPlayerPos(tplayer, x, y, z);
	CreateExplosion(x, y, z, 1, 1);
	format(string, sizeof(string), "[ADMIN]: Admin %s exploded you.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully exploded %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /explode.");
	print(string);
	return 1;
}
CMD:agoto(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, Float:x, Float:y, Float:z;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /agoto <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	GetPlayerPos(tplayer, x, y, z);
	SetPlayerPos(playerid, x, y, z);
	format(string, sizeof(string), "[ADMIN]: Admin %s teleported to you.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully teleported to %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /agoto.");
	print(string);
	return 1;
}
CMD:aget(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, Float:x, Float:y, Float:z;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /aget <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	GetPlayerPos(playerid, x, y, z);
	SetPlayerPos(tplayer, x, y, z);
	format(string, sizeof(string), "[ADMIN]: Admin %s teleported you to their location.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully teleported %s to your location!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /aget.");
	print(string);
	return 1;
}
CMD:setvw(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, vw;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, vw)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /setvw <ID> <Virtual world ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your Virtual world to: %d!", pname, vw);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's Virtual world to: %d", tname, vw);
	SendClientMessage(playerid, TYellow, string);
	SetPlayerVirtualWorld(tplayer, vw);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /setvw", pname);
    print(string);
	return 1;
}
CMD:ajail(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /ajail <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	if(Jailed[tplayer] == 1) return SendClientMessage(playerid, TRed, "[SERVER]: Player is already jailed!");
    Jail(playerid);
	format(string, sizeof(string), "[ADMIN]: Admin %s jailed you.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully jailed %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /ajail.");
	print(string);
	return 1;
}
CMD:aunjail(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
	if(sscanf(params, "i", tplayer)) return SendClientMessage(playerid, TRed, "[SERVER]: Usage: /aunjail <ID>");
	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	if(Jailed[tplayer] == 0) return SendClientMessage(playerid, TRed, "[SERVER]: Player is already unjailed!");
    Unjail(playerid);
	format(string, sizeof(string), "[ADMIN]: Admin %s unjailed you.", pname);
	SendClientMessage(playerid, TRed, string);
	format(string, sizeof(string), "[ADMIN]: You successfully unjailed %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[COMMAND]: Admin %s used /aunjail.");
	print(string);
	return 1;
}

	// -------------------------[ Admin level 2 ]: -------------------------------- //

CMD:agivecash(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, amount;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, amount)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /agivecash <ID> <Amount>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s gave  $%d!", pname, amount);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You gave %s $%d!", tname, amount);
	SendClientMessage(playerid, TYellow, string);
	GivePlayerMoney(tplayer, amount);
	PlayerInfo[tplayer][pCash] = GetPlayerMoney(tplayer)+amount;
    format(string, sizeof(string),"[COMMAND]: Admin %s used /agivecash", pname);
    print(string);
	return 1;
}
CMD:asetscore(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer, amount;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "ud", tplayer, amount)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /asetscore <ID> <Amount>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s set your score to  %d!", pname, amount);
	SendClientMessage(tplayer, TGreen, string);
	format(string, sizeof(string), "[ADMIN]: You've set %s's score to %d!", tname, amount);
	SendClientMessage(playerid, TYellow, string);
	SetPlayerScore(tplayer, amount);
	PlayerInfo[tplayer][pScore] = amount;
    format(string, sizeof(string),"[COMMAND]: Admin %s used /asetscore", pname);
    print(string);
	return 1;
}
CMD:getstats(playerid, params[]) // Bugged, tried fixing it but i failed.
{
	new pname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /getstats <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string),"| Kills: %d | Deaths: %d | Money: %d | Score: %d | Skin ID: %d |", PlayerInfo[tplayer][pKills], PlayerInfo[tplayer][pDeaths], PlayerInfo[tplayer][pCash], PlayerInfo[tplayer][pScore], PlayerInfo[tplayer][pSkin]);
	SendClientMessage(playerid, TGrey, string);
	format(string, sizeof(string),"[COMMAND]: Admin %s used /getstats", pname);
	print(string);
	return 1;
}
CMD:kick(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /kick <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s kicked  %s!", pname, tname);
	SendClientMessageToAll(TRed, string);
	format(string, sizeof(string), "[ADMIN]: You kicked %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	SetTimer("Kickp", 2000, false);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /kick & he kicked %s", pname, tname);
    print(string);
	return 1;
}
CMD:ban(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /ban <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: Admin %s banned  %s!", pname, tname);
	SendClientMessageToAll(TRed, string);
	format(string, sizeof(string), "[ADMIN]: You banned %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	SetTimer("Banp", 2000, false);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /ban & he banned %s", pname, tname);
    print(string);
	return 1;
}
CMD:write(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "s", string)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /write <Text>.");
  	SendClientMessageToAll(TRed, string);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /write.", pname);
    print(string);
	return 1;
}
CMD:skick(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /skick <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: You silently kicked %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	SetTimer("Kickp", 2000, false);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /skick & he kicked %s", pname, tname);
    print(string);
	return 1;
}
CMD:sban(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /ban <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: You silently banned %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	SetTimer("Banp", 2000, false);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /sban & he banned %s", pname, tname);
    print(string);
	return 1;
}
CMD:spec(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /spec <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: You're spectating %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	TogglePlayerSpectating(playerid, 1);
	PlayerSpectatePlayer(playerid, tplayer, SPECTATE_MODE_NORMAL);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /spec on %s", pname, tname);
    print(string);
	return 1;
}
CMD:freeze(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /freeze <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: You froze %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[ADMIN: Admin %s froze you!");
	TogglePlayerControllable(tplayer, 0);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /freeze on %s", pname, tname);
    print(string);
	return 1;
}
CMD:unspec(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], string[128];
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
    TogglePlayerSpectating(playerid, 0);
    SendClientMessage(playerid, TGreen, "[SERVER]: You stopped spectating!");
    format(string, sizeof(string),"[COMMAND]: Admin %s used /unspec", pname);
    print(string);
	return 1;
}
CMD:unfreeze(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], string[128], tplayer;
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(tplayer, tname, sizeof(tname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "u", tplayer)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /unfreeze <ID>.");
  	if(tplayer == INVALID_PLAYER_ID) return SendClientMessage(playerid, TRed, "[SERVER]: Invalid player id.");
	format(string, sizeof(string), "[ADMIN]: You unfroze %s!", tname);
	SendClientMessage(playerid, TYellow, string);
	format(string, sizeof(string), "[ADMIN: Admin %s unfroze you!");
	TogglePlayerControllable(tplayer, 1);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /unfreeze on %s", pname, tname);
    print(string);
	return 1;
}
CMD:ann(playerid, params[])
{
	new pname[MAX_PLAYER_NAME], string[128], style;
	GetPlayerName(playerid, pname, sizeof(pname));
	if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, TRed, "[SERVER]: You must be spawned!");
	if(PlayerInfo[playerid][pAdmin] < 2 ) return SendClientMessage(playerid, TRed, "[SERVER]: You must be a high level admin to use this command!");
  	if(sscanf(params, "s", string, style)) SendClientMessage(playerid, TRed, "[SERVER]: Usage: /ann <Text> <Style>.");
  	GameTextForAll(string, 10000, style);
    format(string, sizeof(string),"[COMMAND]: Admin %s used /ann.", pname);
    print(string);
	return 1;
}
forward Banp(playerid);
public Banp(playerid)
{
	Ban(playerid);
}
forward Kickp(playerid);
public Kickp(playerid)
{
	Kick(playerid);
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch( dialogid )
    {
        case DRegister:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DRegister, DIALOG_STYLE_PASSWORD, ""DWhite"Registering...",""DRed"You have entered an invalid password.\n"DWhite"Type your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Kills",0);
                INI_WriteInt(File,"Deaths",0);
                INI_WriteInt(File,"Score",0);
                INI_WriteInt(File,"Skin", 1);
                INI_Close(File);

                SpawnPlayer(playerid);
                ShowPlayerDialog(playerid, DRSuccess, DIALOG_STYLE_MSGBOX,""DWhite"Success!",""DWhite"You successfully registred.","Okay","");
			}
        }

        case DLogin:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);
					ShowPlayerDialog(playerid, DLSuccess, DIALOG_STYLE_MSGBOX,""DWhite"Success!",""DWhite"You have successfully logged in!","Ok","");
                }
                else
                {
                    ShowPlayerDialog(playerid, DLogin, DIALOG_STYLE_PASSWORD,""DWhite"Login",""DRed"You have entered an incorrect password.\n"DWhite"Type your password below to login.","Login","Quit");
                }
                return 1;
            }
        }

        case DShop:
        {
        	if (!response) return SendClientMessage(playerid, TRed, "[SERVER]: You closed /shop.");
        	if (response)
        	{
        	   switch(listitem)
        	   {
        	   	  case 0: 
        	   	  {
        	   	  	if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid, TRed, "[SERVER]: You must have atleast $1,000!");
        	   	  	SetPlayerArmour(playerid, 100);
        	   	  	GivePlayerMoney(playerid, -1000);
        	   	  	SendClientMessage(playerid, TGreen, "[SERVER]: You just bought an item from /shop!");
        	   	  }
        	   	    case 1: 
        	   	  {
        	   	  	if(GetPlayerMoney(playerid) < 2500) return SendClientMessage(playerid, TRed, "[SERVER]: You must have atleast $2,500!");
        	   	  	GivePlayerWeapon(playerid, 24, 99999);
        	   	  	GivePlayerMoney(playerid, -2500);
        	   	  	SendClientMessage(playerid, TGreen, "[SERVER]: You just bought an item from /shop!");
        	   	  }
        	   	    case 2: 
        	   	  {
        	   	  	if(GetPlayerMoney(playerid) < 3500) return SendClientMessage(playerid, TRed, "[SERVER]: You must have atleast $3,500!");
        	   	  	GivePlayerWeapon(playerid, 25, 99999);
        	   	  	GivePlayerMoney(playerid, -3500);
        	   	  	SendClientMessage(playerid, TGreen, "[SERVER]: You just bought an item from /shop!");
        	   	  }
        	   	    case 3: 
        	   	  {
        	   	  	if(GetPlayerMoney(playerid) < 5000) return SendClientMessage(playerid, TRed, "[SERVER]: You must have atleast $5,000!");
        	   	  	GivePlayerWeapon(playerid, 31, 99999);
        	   	  	GivePlayerMoney(playerid, -2500);
        	   	  	SendClientMessage(playerid, TGreen, "[SERVER]: You just bought an item from /shop!");
        	   	  }
        	   	    case 4: 
        	   	  {
        	   	  	if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid, TRed, "[SERVER]: You must have atleast $10,000!");
        	   	  	GivePlayerWeapon(playerid, 32, 99999);
        	   	  	GivePlayerMoney(playerid, -3500);
        	   	  	SendClientMessage(playerid, TGreen, "[SERVER]: You just bought an item from /shop!");
        	   	  }

        	   }

        	}
        }       
    }
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

// ------------------------------------------------------------------------- //

stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}
stock Jail(playerid)
{
	if(IsPlayerConnected(playerid))
	{
       new Float:x, Float:y, Float:z;
       GetPlayerPos(playerid, x, y, z);
       Ironbars1[playerid] = CreateObject(985, x, y+4, z, 0.0, 0.0, 0.0); //
       Ironbars2[playerid] = CreateObject(985, x+4, y, z, 0.0, 0.0, 90.0); // --------- > Taken from SA:MP forums
       Ironbars3[playerid] = CreateObject(985, x-4, y, z, 0.0, 0.0, 270.0); // -------- > Useful functions
       Ironbars4[playerid] = CreateObject(985, x, y-4, z, 0.0, 0.0, 180.0); //
       Jailed[playerid] = 1;
       PlayerPlaySound(playerid, 1137, x, y, z);
	}

}
stock Unjail(playerid)
{
	Ironbars1[playerid] = DestroyObject(Ironbars1[playerid]);
	Ironbars2[playerid] = DestroyObject(Ironbars2[playerid]);
	Ironbars3[playerid] = DestroyObject(Ironbars3[playerid]);
	Ironbars4[playerid] = DestroyObject(Ironbars4[playerid]);
	Jailed[playerid] = 0;

}

// ------------------------------------------------------------------------- //
