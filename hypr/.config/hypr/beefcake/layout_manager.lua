local layouts = {
  { name = "dwindle",   cmd = "togglesplit",     alt_cmd = "" },
  { name = "scrolling", cmd = "colresize -conf", alt_cmd = "colresize +conf" },
  { name = "master",    cmd = "swapwithmaster",  alt_cmd = "" },
  { name = "monocle",   cmd = "cycleprev",       alt_cmd = "cyclenext" }
}

local layout_indices = {}
for index, layout in ipairs(layouts) do
  layout_indices[layout.name] = index
end

local function get_workspace()
  local workspace = hl.get_active_workspace()
  if hl.get_active_special_workspace() then
    workspace = hl.get_active_special_workspace()
  end
  return workspace
end

local M = {}

function M.command()
    local workspace = get_workspace()
    if not workspace then
        return
    end

    local layout_idx = layout_indices[workspace.tiled_layout]
    local layout = layouts[layout_idx]
    hl.dispatch(hl.dsp.layout(layout.cmd))
end

function M.alt_command()
    local workspace = get_workspace()
    if not workspace then
        return
    end

    local layout_idx = layout_indices[workspace.tiled_layout]
    local layout = layouts[layout_idx]
    hl.dispatch(hl.dsp.layout(layout.alt_cmd))
end

function M.prev_layout()
  local workspace = get_workspace()
  if not workspace then
    return
  end

  local layout_idx = layout_indices[workspace.tiled_layout] - 1
  if layout_idx < 1 then
    layout_idx = #layouts
  end
  local prev_layout = layouts[layout_idx].name;

  if workspace.special then
    hl.workspace_rule({ workspace = workspace.name, layout = prev_layout })
  else
    hl.workspace_rule({ workspace = tostring(workspace.id), layout = prev_layout })
  end
end

function M.next_layout()
  local workspace = get_workspace()
  if not workspace then
    return
  end

  local layout_idx = layout_indices[workspace.tiled_layout] + 1
  if layout_idx > #layouts then
    layout_idx = 1
  end
  local next_layout = layouts[layout_idx].name;

  if workspace.special then
    hl.workspace_rule({ workspace = workspace.name, layout = next_layout })
  else
    hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
  end
end
return M
