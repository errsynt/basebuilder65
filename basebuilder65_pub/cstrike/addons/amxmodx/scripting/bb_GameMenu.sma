#include <amxmodx>
#include <amxmisc>
#include <engine>
#include <hamsandwich>
#include <cstrike>
#include <fun>
#include <cromchat>
#include <basebuilder>

#pragma tabsize 0

#define PLUGIN "Game menu"
#define VERSION "1.0"
#define AUTHOR "Fixlt"

new ChooseTeamOverrideActive[33];

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_clcmd("say /menu", "GameMenu");
         register_clcmd("chooseteam", "ChooseTeam");
}
public ChooseTeam(id) {
	if (ChooseTeamOverrideActive[id]) {
		GameMenu(id)
		return PLUGIN_HANDLED;
	}
	ChooseTeamOverrideActive[id] = true
	return PLUGIN_CONTINUE;
}

public client_putinserver(id)
ChooseTeamOverrideActive[id] = true

public GameMenu(id)
{
    new szText[555 char]
     
    formatex(szText, charsmax(szText), "\yGame Menu:")
    new AdminMenu = menu_create(szText, "Handle_GameMenu")
    
    formatex(szText, charsmax(szText), "\wBuy Weapons")
    menu_additem(AdminMenu, szText, "1", 0)
     
    formatex(szText, charsmax(szText), "\wBuy Extra Items")
    menu_additem(AdminMenu, szText, "2", 0)

    formatex(szText, charsmax(szText), "\wChoose Zombie Class")
    menu_additem(AdminMenu, szText, "3", 0)

    formatex(szText, charsmax(szText), "\wBuilders Menu")
    menu_additem(AdminMenu, szText, "4", 0)
   
    formatex(szText, charsmax(szText), "\wHelp^n")
    menu_additem(AdminMenu, szText, "5", 0)

    formatex(szText, charsmax(szText), "\ySuper VIP Items")
    menu_additem(AdminMenu, szText, "6", ADMIN_LEVEL_H)

    formatex(szText, charsmax(szText), "\wAdmin Menu")
    menu_additem(AdminMenu, szText, "7", ADMIN_LEVEL_G)

    menu_setprop(AdminMenu, MPROP_EXIT, MEXIT_ALL)
    menu_display(id, AdminMenu, 0)
    
    return PLUGIN_HANDLED
}
public Handle_GameMenu(id, menu, item) 
{  
    if(item == MENU_EXIT)
    {
        menu_destroy(menu)
        return PLUGIN_HANDLED
    }
    
    new data[6], iName[64], access, callback
    menu_item_getinfo(menu, item, access, data, charsmax(data), iName, charsmax(iName), callback )
    new key = str_to_num(data)
    
    switch(key)
    {       
        case 1: client_cmd(id, "say /guns")
        case 2: client_cmd(id, "say /shop")
        case 3: client_cmd(id, "say /class")
        case 4: OpenBuildersMenu(id)
        case 5: client_cmd(id, "say /help")
        case 6: client_cmd(id, "say /vs")
        case 7: client_cmd(id, "amxmodmenu")

    }
    return PLUGIN_HANDLED
}

/* builders menu */
public OpenBuildersMenu(id)
{

    new szBuildersMenu = menu_create("\rBuilders Menu:", "szBuildersMenuHandler")
    menu_additem(szBuildersMenu, "\wColors", "0", 0)
    menu_additem(szBuildersMenu, "\wLock Block", "1", 0)
    menu_setprop(szBuildersMenu, MPROP_EXIT, MEXIT_ALL )
    menu_display(id, szBuildersMenu, 0)
     
    if ( cs_get_user_team(id) == CS_TEAM_T )
    {
    CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, the &x04monsters &x01can't open the &x04builders &x01menu!") 
    GameMenu(id)
    } 
     
}
public szBuildersMenuHandler(id, szBuildersMenu, item)
{
    if(item == MENU_EXIT)
    {
        menu_destroy(szBuildersMenu)
        return PLUGIN_HANDLED
    }

    switch(item)
    {
        case 0:
        {
            client_cmd(id, "say /colors")
        }
        case 1:
        {
            client_cmd(id, "say /claim")
        }
    }
    return PLUGIN_CONTINUE
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1033\\ f0\\ fs16 \n\\ par }
*/
