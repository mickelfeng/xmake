--!The Automatic Cross-platform Build Tool
-- 
-- XMake is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.
-- 
-- XMake is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public License
-- along with XMake; 
-- If not, see <a href="http://www.gnu.org/licenses/"> http://www.gnu.org/licenses/</a>
-- 
-- Copyright (C) 2009 - 2015, ruki All rights reserved.
--
-- @author      ruki
-- @file        verbose.lua
--


-- define module: verbose
local verbose = verbose or {}

-- load modules
local io = require("base/io")

-- the main function
function verbose.main(self, ...)

    -- verbose all
    if xmake._OPTIONS.verbose then
        for _, v in ipairs(...) do
            io.write(string.format("%s ", v:gsub("%%(%x%x)", function (w) return string.char(tonumber(w, 16)) end)))
        end
        io.write("\n")
    end

    -- ok
    return true
end

-- return module: verbose
return verbose
