#include <amxmodx>
#include <fun>
#include <cstrike>

#define PLUGIN "VIP bouns"
#define VERSION "1.0"
#define AUTHOR "Fixlt"

#pragma semicolon 1

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR);
	
	register_event("DeathMsg", "EV_DeathMsg", "a");
}

public EV_DeathMsg( )
{
		
	new IDauthor = read_data( 1 );
	if (get_user_flags( IDauthor ) & ADMIN_LEVEL_H) {
         set_hudmessage(0, 255, 0, -1.0, 0.15, 0, 1.0, 1.0, 0.1, 0.1, -1);
         show_hudmessage( IDauthor, "You healed +10 HP");
	 
	cs_set_user_money( IDauthor, cs_get_user_money( IDauthor ) + 500 );
	set_user_health( IDauthor, get_user_health( IDauthor ) + 10 );
	set_user_armor( IDauthor, get_user_armor( IDauthor ) + 15 );
	
         }
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1033\\ f0\\ fs16 \n\\ par }
*/