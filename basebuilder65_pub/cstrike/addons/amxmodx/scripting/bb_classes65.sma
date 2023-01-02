#include <amxmodx>
#include <basebuilder>
#include <hamsandwich>
#include <fun>
#include <cstrike>

#define PLUGIN "Zombie Classes"
#define VERSION "6.6"
#define AUTHOR "Fixlt"

// Classic zombie attributes
new const zclass1_name[] = { "Classic Zombie" }
new const zclass1_info[] = { "\y| \r[ \yFree \r]" }
new const zclass1_model[] = { "bb_classic" }
new const zclass1_clawmodel[] = { "v_bloodyhands" }
const zclass1_health = 3000
const zclass1_speed = 260
const Float:zclass1_gravity = 1.0
const zclass1_adminflags = ADMIN_ALL

// Jumper zombie attributes
new const zclass2_name[] = { "Jumper Zombie" }
new const zclass2_info[] = { "\y| \r[ \yFree \r]" }
new const zclass2_model[] = { "bb_jumper" }
new const zclass2_clawmodel[] = { "v_bloodyhands" }
const zclass2_health = 2800
const zclass2_speed = 290
const Float:zclass2_gravity = 0.5
const zclass2_adminflags = ADMIN_ALL

// Tanker zombie attributes
new const zclass3_name[] = { "Tanker Zombie" }
new const zclass3_info[] = { "\y| \r[ \yFree \r]" }
new const zclass3_model[] = { "bb_tanker" }
new const zclass3_clawmodel[] = { "v_bloodyhands" }
const zclass3_health = 3500
const zclass3_speed = 210
const Float:zclass3_gravity = 1.0
const zclass3_adminflags = ADMIN_ALL
#define TANK_ARMOR 200

// Boogeyman zombie attributes
new const zclass4_name[] = { "Boogeyman Zombie" }
new const zclass4_info[] = { "\y| \r[ \yFree \r]" }
new const zclass4_model[] = { "bb_boogeyman" }
new const zclass4_clawmodel[] = { "v_bloodyhands" }
const zclass4_health = 4500
const zclass4_speed = 250
const Float:zclass4_gravity = 1.0
const zclass4_adminflags = ADMIN_ALL

// Hunter zombie attributes
new const zclass5_name[] = { "Hunter Zombie" }
new const zclass5_info[] = { "\y| \r[ \yV.I.P \r]" }
new const zclass5_model[] = { "bb_hunter" }
new const zclass5_clawmodel[] = { "v_bloodyhands" }
const zclass5_health = 5000
const zclass5_speed = 300
const Float:zclass5_gravity = 0.5
const zclass5_adminflags = ADMIN_LEVEL_H

// Doctor zombie attributes
new const zclass6_name[] = { "Doctor Zombie" }
new const zclass6_info[] = { "\y| \r[ \yLite Admin \r]" }
new const zclass6_model[] = { "bb_doctor" }
new const zclass6_clawmodel[] = { "v_doctor_hands" }
const zclass6_health = 6000
const zclass6_speed = 330
const Float:zclass6_gravity = 1.0
const zclass6_adminflags = ADMIN_LEVEL_G

// Lavva zombie attributes
new const zclass7_name[] = { "Lavva Zombie" }
new const zclass7_info[] = { "\y| \r[ \yFull Admin \r]" }
new const zclass7_model[] = { "bb_lavva" }
new const zclass7_clawmodel[] = { "v_lavva_hands" }
const zclass7_health = 7500
const zclass7_speed = 350
const Float:zclass7_gravity = 0.4
const zclass7_adminflags = ADMIN_LEVEL_F

// ProHunter zombie attributes
new const zclass8_name[] = { "ProHunter Zombie" }
new const zclass8_info[] = { "\y| \r[ \yHead Admin \r]" }
new const zclass8_model[] = { "bb_prohunter" }
new const zclass8_clawmodel[] = { "v_prohunter_hands" }
const zclass8_health = 8500
const zclass8_speed = 360
const Float:zclass8_gravity = 0.3
const zclass8_adminflags = ADMIN_LEVEL_E

new g_zclass_tanker

// Zombie classes MUST be registered on plugin_precache
public plugin_precache()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	bb_register_zombie_class(zclass1_name, zclass1_info, zclass1_model, zclass1_clawmodel, zclass1_health, zclass1_speed, zclass1_gravity, 0.0, zclass1_adminflags)
	bb_register_zombie_class(zclass2_name, zclass2_info, zclass2_model, zclass2_clawmodel, zclass2_health, zclass2_speed, zclass2_gravity, 0.0, zclass2_adminflags)
	bb_register_zombie_class(zclass3_name, zclass3_info, zclass3_model, zclass3_clawmodel, zclass3_health, zclass3_speed, zclass3_gravity, 0.0, zclass3_adminflags)
	g_zclass_tanker = bb_register_zombie_class(zclass4_name, zclass4_info, zclass4_model, zclass4_clawmodel, zclass4_health, zclass4_speed, zclass4_gravity, 0.0, zclass4_adminflags)
	bb_register_zombie_class(zclass5_name, zclass5_info, zclass5_model, zclass5_clawmodel, zclass5_health, zclass5_speed, zclass5_gravity, 0.0, zclass5_adminflags)
	bb_register_zombie_class(zclass6_name, zclass6_info, zclass6_model, zclass6_clawmodel, zclass6_health, zclass6_speed, zclass6_gravity, 0.0, zclass6_adminflags)
	bb_register_zombie_class(zclass7_name, zclass7_info, zclass7_model, zclass7_clawmodel, zclass7_health, zclass7_speed, zclass7_gravity, 0.0, zclass7_adminflags)
	bb_register_zombie_class(zclass8_name, zclass8_info, zclass8_model, zclass8_clawmodel, zclass8_health, zclass8_speed, zclass8_gravity, 0.0, zclass8_adminflags)
}

#if defined TANK_ARMOR
public plugin_init()
{
	RegisterHam(Ham_Spawn, "player", "ham_PlayerSpawn_Post", 1)
}

public ham_PlayerSpawn_Post(id)
{
	if (!is_user_alive(id))
		return ;
		
	if (bb_is_user_zombie(id) && bb_get_user_zombie_class(id) == g_zclass_tanker)
	{
		give_item(id, "item_assaultsuit");
		cs_set_user_armor(id, TANK_ARMOR, CS_ARMOR_VESTHELM);
	}
}
#endif