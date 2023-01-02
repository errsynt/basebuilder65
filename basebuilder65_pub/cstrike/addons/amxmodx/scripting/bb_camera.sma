#include <amxmodx>
#include <amxmisc>
#include <engine>

#define PLUGIN "3d camera"
#define VERSION "1.0"
#define AUTHOR "Fixlt"

#define MAX_PLAYERS 32

new g_Camera;
new iCamera[33];

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_clcmd("say /cam", "camera");
	register_clcmd("say_team /cam", "camera");
	
	g_Camera = register_cvar("camera_3d", "1")
}

public client_putinserver( id )
{
	iCamera[id] = false
}

public plugin_modules()
{
	require_module("engine")
}

public plugin_precache()
{
	precache_model("models/rpgrocket.mdl")
}

public camera(id)
{
	if(get_pcvar_num (g_Camera))
	{
		if((iCamera[id] = !iCamera[id]))
		{
			set_view(id, CAMERA_3RDPERSON);
		}
		else
		{
			set_view(id, CAMERA_NONE);
		}
	}
	
	return PLUGIN_HANDLED;
}