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
-- @file        ar.lua
--

-- define module: ar
local ar = ar or {}

-- load modules
local utils     = require("base/utils")
local string    = require("base/string")
local config    = require("base/config")

-- init the linker
function ar.init(self, name)

    -- save name
    self._NAME = name or "ar"

    -- init arflags
    self.arflags = { "-crs" }

end

-- make the link command
function ar.command_link(self, objfiles, targetfile, flags, logfile)

    -- redirect
    local redirect = ""
    if logfile then redirect = string.format(" > %s 2>&1", logfile) end

    -- make it
    return string.format("%s %s %s %s%s", self._NAME, flags, targetfile, objfiles, redirect)
end

-- the main function
function ar.main(self, cmd)

    -- execute it
    local ok = os.execute(cmd)

    -- ok?
    return utils.ifelse(ok == 0, true, false)
end

-- return module: ar
return ar
