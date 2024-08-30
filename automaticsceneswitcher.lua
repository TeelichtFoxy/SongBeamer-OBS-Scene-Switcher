obs = obslua

PROJECTOR_TYPE_SCENE = "Scene"
PROJECTOR_TYPE_PROGRAM = "StudioProgram"

VARS_GROUP = "vgp"
QUELLEN_GROUP = "qgp"
SCENES_GROUP = "sgp"
PROGRAM = "Program Output"
STARTUP = "su"

refreshTime = 1000  -- default refresh time
local sceneText = ""
local sceneMedia = ""
local scenePause = ""
local ndiSource = ""
scene = ""

function script_description()
    return "Switches the Scenes automatically.\n\nBy Elias Skibb for CGN 2024"
end

function script_properties()
    local props = obs.obs_properties_create()
    local qgp = obs.obs_properties_create()
    local sgp = obs.obs_properties_create()
    local vgp = obs.obs_properties_create()

    obs.obs_properties_add_int(vgp, "refreshTime", "Wiederholungsintervall (ms)", 1000, 2000, 100)
    obs.obs_properties_add_group(props, VARS_GROUP, "Variablen", obs.OBS_GROUP_NORMAL, vgp)

    local ql = obs.obs_properties_add_list(qgp, "ndiSource", "NDI Quelle", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
    local sources = obs.obs_enum_sources()
    if sources ~= nil then
        for _, source in ipairs(sources) do
            local name = obs.obs_source_get_name(source)
            obs.obs_property_list_add_string(ql, name, name)
        end
    end
    obs.obs_properties_add_group(props, QUELLEN_GROUP, "Quellen", obs.OBS_GROUP_NORMAL, qgp)

    local scenes = obs.obs_frontend_get_scenes()
    local stl = obs.obs_properties_add_list(sgp, "sceneText", "Text Szene", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
    local sml = obs.obs_properties_add_list(sgp, "sceneMedia", "Medien Szene", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
    local spl = obs.obs_properties_add_list(sgp, "scenePause", "Pause Szene", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
    if scenes ~= nil then
        for _, scene in ipairs(scenes) do
            local name = obs.obs_source_get_name(scene)
            obs.obs_property_list_add_string(stl, name, name)
            obs.obs_property_list_add_string(sml, name, name)
            obs.obs_property_list_add_string(spl, name, name)
        end
    end
    obs.obs_properties_add_group(props, SCENES_GROUP, "Szenen", obs.OBS_GROUP_NORMAL, sgp)

    return props
end

function script_update(settings)
    refreshTime = obs.obs_data_get_int(settings, "refreshTime")
    sceneText = obs.obs_data_get_string(settings, "sceneText")
    sceneMedia = obs.obs_data_get_string(settings, "sceneMedia")
    scenePause = obs.obs_data_get_string(settings, "scenePause")

    obs.timer_remove(switcher)
    obs.timer_add(switcher, refreshTime)
end

function script_load(settings)
    refreshTime = obs.obs_data_get_int(settings, "refreshTime")
    sceneText = obs.obs_data_get_string(settings, "sceneText")
    sceneMedia = obs.obs_data_get_string(settings, "sceneMedia")
    scenePause = obs.obs_data_get_string(settings, "scenePause")

    obs.timer_remove(switcher)
    obs.timer_add(switcher, refreshTime)
end

function switcher()
    print("switcher started")
    local path = "C:/ES-OBS-Script-Dateien/"

    print("opening file:" .. path .. "sboutput.txt")
    local file = io.open(path .. "sboutput.txt", "r")
    print(file)
    if file then
        print("FILE: TRUE")
        io.close(file)
        switch_to_scene(sceneText)
    else
        print("FILE: False")
        switch_to_scene(sceneMedia)
    end
end

function switch_to_scene(scene_name)
    print("switch_to_scene:" .. scene_name)
    local scene = obs.obs_get_scene_by_name(scene_name)
    local current_scene_name = obs.obs_source_get_name(obs.obs_frontend_get_current_scene())
    print("current scene: " .. current_scene_name)
    print("scene:" .. scene_name)
    if scene then
        if scene_name == current_scene_name then
            print("Szene ist bereits die aktuellste")
        else
            print("switching to scene: " .. scene_name)
            local scene_source = obs.obs_scene_get_source(scene)
            obs.obs_frontend_set_current_scene(scene_source)
            obs.obs_source_release(scene_source)
            obs.obs_scene_release(scene)
        end
    else
        print("Scene not found: " .. scene_name)
    end
end