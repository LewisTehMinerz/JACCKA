--# Kernel Main #--

KernelInfo = {
  ["name"] = "JACCKA",
  ["os"] = "InsertNameOfOSHere",
  ["ico"] = paintutils.loadImage("YourImageHere "), -- Has to be 3x3
  ["bootinto"] = "YourFileHere",
}

paintutils.drawImage( KernelInfo[ "ico" ] )
term.setCursorPos( 1, 4 )
print( "Starting " .. KernelInfo[ "os" ] )
print( "Press F2 for Kernel Setup Utility. (5 seconds to press)" )
parallel.waitForAny( 
  function()
    local count = 0
    while count < 5 do
      local event, scancode = os.pullEvent("key")
      if keys.getName(scancode) == "f2" then
        shell.run( "/kernel/setuputility" )
      end
      count = count + 1
      sleep( 1 )
    end
  end
)
