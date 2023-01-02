#include <amxmodx>
#include <amxmisc>
#include <basebuilder>

#define PLUGIN "Show HP damage"
#define VERSION "1.0"
#define AUTHOR "Fixlt"


public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_event("Damage","event_damage","b","2!0","3=0","4!0");
}

public event_damage(id)
{
	new killer = get_user_attacker(id)
	if(bb_is_user_zombie(id))
	client_print(killer, print_center, "HP: %i", get_user_health(id))
}