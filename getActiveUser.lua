local user = 'default'
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

read_file(os.getenv("HOME") .. "/.config/nvim/activeUser")
-- print ('this came from my new magic code')
-- print (user)

-- set userName to choose appropriate config file directory structure
local a = vim.api -- for conciseness
a.nvim_set_var(  
  "userName",
  user 
)
