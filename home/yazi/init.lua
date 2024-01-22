function Manager:render(area)
    self.area = area

    local chunks = ui.Layout():direction(ui.Layout.HORIZONTAL):constraints({
        ui.Constraint.Ratio(MANAGER.ratio.parent, MANAGER.ratio.all),
        ui.Constraint.Ratio(MANAGER.ratio.current, MANAGER.ratio.all),
        ui.Constraint.Ratio(MANAGER.ratio.preview, MANAGER.ratio.all)
    }):split(area)

    local bar = function(c, x, y)
        return ui.Bar(ui.Rect {
            x = math.max(0, x),
            y = math.max(0, y),
            w = math.min(1, area.w),
            h = math.min(1, area.h)
        }, ui.Bar.TOP):symbol(c)
    end

    return ya.flat {
        -- Borders
        ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED),
        ui.Bar(chunks[1], ui.Bar.RIGHT), ui.Bar(chunks[3], ui.Bar.LEFT),

        bar("┬", chunks[1].right - 1, chunks[1].y),
        bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
        bar("┬", chunks[2].right, chunks[2].y),
        bar("┴", chunks[2].right, chunks[1].bottom - 1), -- Parent
        Parent:render(chunks[1]:padding(ui.Padding.xy(1))), -- Current
        Current:render(chunks[2]:padding(ui.Padding.y(1))), -- Preview
        Preview:render(chunks[3]:padding(ui.Padding.xy(1)))
    }
end

Status = {area = ui.Rect.default}

function Status.style()
    if cx.active.mode.is_select then
        return THEME.status.mode_select
    elseif cx.active.mode.is_unset then
        return THEME.status.mode_unset
    else
        return THEME.status.mode_normal
    end
end

function Status:mode()
    local mode = tostring(cx.active.mode):upper()
    if mode == "UNSET" then mode = "UN-SET" end

    local style = self.style()
    return ui.Line {
        ui.Span(THEME.status.separator_open):fg(style.bg),
        ui.Span(" " .. mode .. " "):style(style)
    }
end

function Status:size()
    local h = cx.active.current.hovered
    if h == nil then return ui.Line {} end

    local style = self.style()
    return ui.Line {
        ui.Span(" " .. ya.readable_size(h:size() or h.cha.length) .. " "):fg(
            style.bg):bg(THEME.status.separator_style.bg),
        ui.Span(THEME.status.separator_close):fg(THEME.status.separator_style.fg)
    }
end

function Status:name()
    local h = cx.active.current.hovered
    if h == nil then return ui.Span("") end
    local linked = ""
    if h.link_to ~= nil then linked = " -> " .. tostring(h.link_to) end
    return ui.Span(" " .. h.name .. linked)
end

function Status:permissions()
    local h = cx.active.current.hovered
    if h == nil then return ui.Line {} end

    local perm = h.cha:permissions()
    if perm == nil then return ui.Line {} end

    local spans = {}
    for i = 1, #perm do
        local c = perm:sub(i, i)
        local style = THEME.status.permissions_t
        if c == "-" then
            style = THEME.status.permissions_s
        elseif c == "r" then
            style = THEME.status.permissions_r
        elseif c == "w" then
            style = THEME.status.permissions_w
        elseif c == "x" or c == "s" or c == "S" or c == "t" or c == "T" then
            style = THEME.status.permissions_x
        end
        spans[i] = ui.Span(c):style(style)
    end
    return ui.Line(spans)
end

function Status:percentage()
    local percent = 0
    local cursor = cx.active.current.cursor
    local length = #cx.active.current.files
    if cursor ~= 0 and length ~= 0 then
        percent = math.floor((cursor + 1) * 100 / length)
    end

    if percent == 0 then
        percent = "  Top "
    else
        percent = string.format(" %3d%% ", percent)
    end

    local style = self.style()
    return ui.Line {
        ui.Span(" " .. THEME.status.separator_open):fg(THEME.status
                                                           .separator_style.fg),
        ui.Span(percent):fg(style.bg):bg(THEME.status.separator_style.bg)
    }
end

function Status:position()
    local cursor = cx.active.current.cursor
    local length = #cx.active.current.files

    local style = self.style()
    return ui.Line {
        ui.Span(string.format(" %2d/%-2d ", cursor + 1, length)):style(style),
        ui.Span(THEME.status.separator_close):fg(style.bg)
    }
end

function Status:render(area)
    self.area = area

    local left = ui.Line {self:mode(), self:size(), self:name()}
    local right = ui.Line {
        self:owner(), self:permissions(), self:percentage(), self:position()
    }
    return {
        ui.Paragraph(area, {left}),
        ui.Paragraph(area, {right}):align(ui.Paragraph.RIGHT),
        table.unpack(Progress:render(area, right:width()))
    }
end

function Status:owner()
    local h = cx.active.current.hovered
    if h == nil or ya.target_family() ~= "unix" then return ui.Line {} end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ui.Span(":"),
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        ui.Span(" ")
    }
end
