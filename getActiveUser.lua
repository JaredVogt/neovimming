-- Set gobal `activeUser`

local user = 'default'

-- if activeUser can't be read, set user to 'default'
local function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if file 
      then 
        -- os.exit()
        local content = file:read "*a" -- *a or *all reads the whole file
        file:close()
        user = content:gsub("\n[^\n]*(\n?)$", "%1")
        -- print ('There is no activeUser file. Using default paths') 
      end
end
-- FIXME this should warn the user that active file is not present

-- attempt to read activeUser file
read_file(os.getenv("HOME") .. "/.config/nvim/activeUser")

-- set the variable
local a = vim.api -- for conciseness
a.nvim_set_var(  
  "userName",
  user 
)
