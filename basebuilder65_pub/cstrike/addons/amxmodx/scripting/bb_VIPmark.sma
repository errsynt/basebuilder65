#include <amxmodx>

#define PLUGIN "VIP status"
#define VERSION "1.0"
#define AUTHOR "Fixlt"


public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_event("ResetHUD", "ResetHUD", "be");
}

public ResetHUD(id)
{
	set_task(0.5, "VIP", id + 6910)
}

public VIP(TaskID)
{
	new id = TaskID - 6910
	
	if (get_user_flags(id) & ADMIN_LEVEL_H) {
	
		message_begin(MSG_ALL, get_user_msgid("ScoreAttrib"))
		write_byte(id)
		write_byte(4)
		message_end()
	}
}