local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close
local get_hex = require("cokeline/utils").get_hex

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_4
local dark = get_hex("Normal", "bg")
local text = get_hex("Comment", "fg")
local grey = get_hex("ColorColumn", "bg")
local light = get_hex("Comment", "fg")
local high = "#a6d120"

local padding =
    setmetatable(
    {
        text = " ",
        truncation = {priority = 1}
    },
    {
        __call = function(_, n)
            return {
                text = string.rep(" ", n),
                truncation = {priority = 1}
            }
        end
    }
)

require("cokeline").setup(
    {
        default_hl = {
            fg = function(buffer)
                if buffer.is_focused then
                    -- return dark
                    return high
                end
                return text
            end,
            bg = function(buffer)
                if buffer.is_focused then
                    -- return high
                    return dark
                end
                return grey
            end
        },
        components = {
            {
                text = function(buffer)
                    return (buffer.index ~= 1) and "▏" or ""
                end,
            },
            {
                text = function(buffer)
                    if buffer.index ~= 1 then
                        return ""
                    end
                    return ""
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        return high
                    end
                    return grey
                end,
                fg = dark
            },
            padding(1),
            {
                text = function(buffer)
                    if is_picking_focus() or is_picking_close() then
                        return buffer.pick_letter .. " "
                    end

                    return buffer.devicon.icon
                end,
                fg = function(buffer)
                    if is_picking_focus() then
                        return yellow
                    end
                    if is_picking_close() then
                        return red
                    end

                    if buffer.is_focused then
                        -- return dark
                        return high
                    else
                        return light
                    end
                end,
                style = function(_)
                    return (is_picking_focus() or is_picking_close()) and "italic,bold" or nil
                end
            },
            {
                text = function(buffer)
                    return buffer.unique_prefix .. buffer.filename .. "⠀"
                end,
                style = function(buffer)
                    return buffer.is_focused and "bold" or nil
                end
            },
            {
                text = function(buffer)
                    return buffer.is_modified and "" or ""
                end,
                delete_buffer_on_left_click = true,
                fg = function(buffer)
                    return buffer.is_modified and modified_fg or nil
                end,
                truncation = {priority = 1}
            },
            padding(1)
        }
    }
)
