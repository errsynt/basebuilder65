#include <amxmodx>
#include <amxmisc>
#include <cstrike>

#define PLUGIN "VIP skin"
#define VERSION "1.0"
#define AUTHOR "Fixlt"


public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_event("ResetHUD", "resetModel", "b")
         return PLUGIN_CONTINUE
}

public plugin_precache() {
        precache_model("models/player/bb_vip/bb_vip.mdl")
        return PLUGIN_CONTINUE
}

public resetModel(id, level, cid) {
        if (get_user_flags(id) & ADMIN_LEVEL_H) {
        new CsTeams:userTeam = cs_get_user_team(id)

        if(userTeam == CS_TEAM_CT) {
         cs_set_user_model(id, "bb_vip")
        }
        else {
         cs_reset_user_model(id)
        }
	
    }
         return PLUGIN_CONTINUE
}