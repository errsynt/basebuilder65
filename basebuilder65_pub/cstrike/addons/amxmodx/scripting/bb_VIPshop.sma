#include <amxmodx>
#include <cstrike>
#include <fun>
#include <cromchat>
#include <basebuilder>

#define PLUGIN "VShop system"
#define VERSION "1.0"
#define AUTHOR "Fixlt"


public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_clcmd("say /vs", "ClcmdMenu")
}

public ClcmdMenu(id)
{
    new szMenu = menu_create("\yVIPShop Menu:", "szMenuHandler")

    if(zp_get_user_zombie(id))
    menu_additem(szMenu, "\dGuns shop", "0", 0)
    else
    menu_additem(szMenu, "\wGuns shop", "0", 0)
    menu_additem(szMenu, "\wHealth shop", "1", 0)


    menu_setprop( szMenu, MPROP_EXIT, MEXIT_ALL )

    menu_display(id, szMenu, 0)

}
public szMenuHandler(id, szMenu, item)
{
    if(item == MENU_EXIT)
    {
        menu_destroy(szMenu)
        return PLUGIN_HANDLED
    }

    switch(item)
    {
        case 0: OpenGunsMenu(id)
        case 1: OpenHealthMenu(id)

    }
    return PLUGIN_CONTINUE
}

public OpenGunsMenu(id)
{
    new szGunsMenu = menu_create("\rGuns shop:", "szGunsMenuHandler")
    menu_additem(szGunsMenu, "G3sg1 weapon \r| \yPrice\r: \y500\r$", "1", 0)
    menu_additem(szGunsMenu, "M4a1 weapon \r| \yPrice\r: \y200\r$", "2", 0)

    menu_setprop(szGunsMenu, MPROP_EXIT, MEXIT_ALL )
    menu_display(id, szGunsMenu, 0)
    
    if ( cs_get_user_team(id) == CS_TEAM_T )
    {
    CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, the &x04zombies &x01can't use the &x04guns &x01shop!") 
    ClcmdMenu(id)
    } 

}

public szGunsMenuHandler(id, szGunsMenu, item)
{
    if(item == MENU_EXIT)
    {
        menu_destroy(szGunsMenu)
        return PLUGIN_HANDLED
    }

    switch(item)
    {
        case 0:
        {
            if(cs_get_user_money(id) < 2500)
            {
                CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, You have not enough money to buy this &x04item &x01!")
                return PLUGIN_HANDLED
            }
            give_item(id, "weapon_g3sg1")
            cs_set_user_bpammo(id, CSW_G3SG1, 200)
            cs_set_user_money(id, cs_get_user_money(id) - 500)
        }
        case 1:
        {
            if(cs_get_user_money(id) < 1000)
            {
                CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, You have not enough money to buy this &x04item &x01!")
                return PLUGIN_HANDLED
            }
            give_item(id, "weapon_m4a1")
            cs_set_user_bpammo(id, CSW_M4A1, 200)
            cs_set_user_money(id, cs_get_user_money(id) - 200)
        }
    }
    return PLUGIN_CONTINUE

}

public OpenHealthMenu(id)
{

    new szHealthMenu = menu_create("\rHealth shop:", "szHealthMenuHandler")
    menu_additem(szHealthMenu, "Health 50% \r| \yPrice\r: \y230\r$", "0", 0) 
    menu_additem(szHealthMenu, "Health 10% \r| \yPrice\r: \y100\r$", "1", 0)
    menu_setprop(szHealthMenu, MPROP_EXIT, MEXIT_ALL )
    menu_display(id, szHealthMenu, 0)

    if ( cs_get_user_team(id) == CS_TEAM_CT )
    {
    CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, the &x04humans &x01can't use the &x04health &x01shop!") 
    ClcmdMenu(id)
    } 
}
public szHealthMenuHandler(id, szHealthMenu, item)
{
    if(item == MENU_EXIT)
    {
        menu_destroy(szHealthMenu)
        return PLUGIN_HANDLED
    }

    switch(item)
    {
        case 0:
        {
            if(cs_get_user_money(id) < 240)
            {
                CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, You have not enough money to buy this &x04item &x01!")
                return PLUGIN_HANDLED
            }
            set_user_health(id, get_user_health(id) + 50)
            cs_set_user_money(id, cs_get_user_money(id) - 230)

        }
        case 1:
        {
            if(cs_get_user_money(id) < 100)
            {
                CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, You have not enough money to buy this &x04item &x01!")
                return PLUGIN_HANDLED
            }
            set_user_health(id, get_user_health(id) + 10)
            cs_set_user_money(id, cs_get_user_money(id) - 100)

        }
        case 2:
        {
            if(cs_get_user_money(id) < 6000)
            {
                CC_SendMessage(id, "&x01[ &x04Base Builder &x01] Sorry, You have not enough money to buy this &x04item &x01!")
                return PLUGIN_HANDLED
            }
            set_user_health(id, get_user_health(id) + 2000)
            cs_set_user_money(id, cs_get_user_money(id) - 6000)

        }
    }
    return PLUGIN_CONTINUE
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1033\\ f0\\ fs16 \n\\ par }
*/