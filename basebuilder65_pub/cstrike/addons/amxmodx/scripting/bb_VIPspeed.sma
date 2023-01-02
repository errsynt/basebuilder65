#include <amxmodx>
#include <amxmisc>
#include <fakemeta>

#define PLUGIN "VIP speed"
#define VERSION "1.0"
#define AUTHOR "Fixlt"

new cvarVipSpeed;

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	cvarVipSpeed = register_cvar("vs_vip_speed", "315");
	register_event("CurWeapon", "EventCurWeapon", "be", "1=1");
}

public EventCurWeapon(id)
{
	if(get_user_flags(id) & ADMIN_LEVEL_H) 
{
fm_set_user_maxspeed(id, get_pcvar_float(cvarVipSpeed));
}
}

stock fm_set_user_maxspeed(index, Float:speed = -1.0) 
{
	engfunc(EngFunc_SetClientMaxspeed, index, speed);
	set_pev(index, pev_maxspeed, speed);
	return 1;
}