-- luau_shim.lua
-- This module defines several functions that exist in Luau but are missing in pure Lua.
-- Simply require this file at the top of your Lua scripts to “enable” these Luau commands.

-- Define table.find: returns the first index at which the value is found, or nil.
if not table.find then
    function table.find(tbl, value)
        for i, v in ipairs(tbl) do
            if v == value then
                return i
            end
        end
        return nil
    end
end

-- Define table.create: returns an array with n copies of a given value.
if not table.create then
    function table.create(n, value)
        local t = {}
        for i = 1, n do
            t[i] = value
        end
        return t
    end
end

-- Define math.clamp: clamps a number between a lower and upper bound.
if not math.clamp then
    function math.clamp(x, lower, upper)
        if x < lower then return lower end
        if x > upper then return upper end
        return x
    end
end

-- Define string.split: splits a string into an array of substrings using a separator.
if not string.split then
    function string.split(s, sep)
        sep = sep or "%s"
        local t = {}
        for substr in string.gmatch(s, "([^" .. sep .. "]+)") do
            table.insert(t, substr)
        end
        return t
    end
end

-- Define typeof: a Luau helper that returns a string describing the type.
if not typeof then
    function typeof(val)
        return type(val)
    end
end

-- Additional polyfills for Luau commands can be added here.
