--[[--
  Name: JACCKA v0.1
  Compyright (c) Lewislovesgames. DO NOT COPY.
--]]--

KernelInfo = {
  [ "name" ] = "JACCKA v0.1",
  [ "file" ] = "InsertNameOfFileHere",
  [ "ico" ] = paintutils.loadImage("YourImageHere "), -- Has to be 3x3
}

paintutils.drawImage( KernelInfo[ "ico" ] )
term.setCursorPos( 1, 4 )
print( "[kernel] Kernel: " KernelInfo[ "name" ] )
print( "[kernel] Starting " .. KernelInfo[ "os" ] )
print( "[stage] Inject Stage" )
print( "[inject] Injecting kernel modifiers..." )
parallel.waitForAll(
  function()
    local f
    if not fs.exists( "inject" ) then
      f = fs.open( "inject", "w" )
      f.write( "\n" )
      f.close()
      f = fs.open( KernelInfo[ "file" ], "a" )
      f.write( " \n\nprint( \"[kernel] Shutdown \" ) \n\nsleep( 3 )" )
      f.close()
    else
      print( "[inject] No need for injection. Skipping..." )
    end
  end
)
shell.run( KernelInfo[ "file" ] )
