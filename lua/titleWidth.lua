local maxlen = 0

function getTimeRoomWidth()
  maxlen = math.max(tex.skip['roomWidth'].width, tex.skip['timeWidth'].width)
  tex.sprint((maxlen/tex.sp("1pt")).."pt")
end

function getTitleBoxWidth()
  local textwidth = tex.dimen['textwidth']
  local fboxsep = tex.dimen['fboxsep']
  tex.sprint(((textwidth - 2 * fboxsep)/tex.sp("1pt")).."pt")
end

function getTitleWidth()
  local textwidth = tex.dimen['textwidth']
  local space = 0.05 * textwidth
  local titleWidth = textwidth - maxlen - space
  tex.sprint((titleWidth/tex.sp("1pt")).."pt")
end
