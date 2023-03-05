


local screenX, screenY = guiGetScreenSize()
local x, y = 1366, 768
local relX, relY = screenX/x, screenY/y
local panelX, panelY, panelWidth, rowHeight = 32*relX, 32*relY, 325*relX, 30*relY
local chaletlondon = dxCreateFont("fonts/chaletlondon.ttf", 24*relY, false, "antialiased")
local signpainter = dxCreateFont("fonts/signpainter.ttf", 24*relY, false, "antialiased")

local currentSwitchTo = 0

addEvent("Rage.onTabEnter", true)

addEvent("Rage.onUseBackspace", true)

addEvent("Rage.onCheckChange", true)

addEvent("Rage.onTabChange", true)

addEvent("Rage.onWindowClose", true)

addEvent("Rage.onSelectChange", true)

addEvent("Rage.onButtonEnter", true)

addEvent("Rage.onCheckEnter", true)

addEvent("Rage.onSelectEnter", true)



local currentUse = 1
local backCurrentY = 0
local windows = {
 --[[  {
      title = "Title";
      title_image = "NORMALE.png";
      title_2 = "Title 2";
      isVisible = true;
      useBackSpace = true;
      Tabs = {
         -- evnt or false or true ( check bool)
      --  {"type","text","event",currentUse,{useses Tab}}
      {"select","Tab 1","",1,{"Ali", "Othamne"}}


      };
  };--]]
  
};


function render ()
    for _, window in pairs(windows) do 
        if window then 
        if window.isVisible then 
            if window.iVisibleRow > #window.Tabs then 
                 window.iVisibleRow = #window.Tabs
            end
		if window.title_image ~= 0 and window.title_image ~= "none" then 
    dxDrawImage(panelX, panelY, panelWidth, 80*relY,window.title_image or "images/NORMALE.png")
	dxDrawText(window.title,panelX+10*relX, panelY, panelWidth+panelX-10*relX, 80*relY+panelY, tocolor(255, 255, 255, 255), 1.15, signpainter, "center", "center")
	end
    dxDrawRectangle(panelX, panelY+80*relY, panelWidth, rowHeight, tocolor(10, 10, 10, 255))
    
   -- dxDrawRectangle(panelX, panelY, panelWidth, notificationData["height"], tocolor(0, 0, 0, 210))

    dxDrawText(utf8.upper(window.title_2), panelX+10*relX, panelY+80*relY, panelWidth+panelX+10*relX, rowHeight+panelY+80*relY, tocolor(53, 76, 115, 255), 0.4, chaletlondon, "left", "center")
	dxDrawText(""..currentUse.."/"..#window.Tabs.."", panelX+10*relX, panelY+80*relY, panelWidth+panelX-10*relX, rowHeight+panelY+80*relY, tocolor(53, 76, 115, 255), 0.5, chaletlondon, "right", "center")

    


    currentY = panelY+110*relY+rowHeight

    for k = window.startRow, window.startRow + window.iVisibleRow - 1, 1 do
		local v = window.Tabs[k]
        
        bgColor = tocolor(0, 0, 0, 210)
        textColor = tocolor(255, 255, 255, 220)
        _color = "#ffffff"
        if (k ~= currentUse) then
            bgColor = tocolor(0, 0, 0, 210)
            textColor = tocolor(255, 255, 255, 220)
            _color = "#ffffff"
        else
            bgColor = tocolor(255, 255, 255, 255)
            textColor = tocolor(0, 0, 0, 255)
            _color = "#000000"

            if v[6] then

                dxDrawImage(panelX, currentY+(rowHeight*(window.iVisibleRow +0.3 )), panelWidth, rowHeight+(#v[6])/2,"images/gradient_bgd.png")
                dxDrawText(v[6], panelX+20*relX, currentY+(rowHeight*(window.iVisibleRow +0.3 )), panelWidth+panelX+10*relX, rowHeight+currentY+(rowHeight*(window.iVisibleRow +0.3 )), tocolor(255,255,255,255), 0.4, chaletlondon, "left", "center",false,true,false,true)
            end

        end
   
        if k == #window.Tabs +1 then
               
            return 
        end

        
            dxDrawRectangle(panelX, currentY+(rowHeight*(window.iVisibleRow -1 )), panelWidth, rowHeight, tocolor(0, 0, 0, 210))
            dxDrawImage(panelX, currentY+(rowHeight*(window.iVisibleRow -1  )), panelWidth, rowHeight, "images/menunav.png")
        



        dxDrawRectangle(panelX, currentY+(rowHeight*(k-1 - window.startRow)), panelWidth, rowHeight, bgColor)
        dxDrawText(v[2], panelX+10*relX, currentY+(rowHeight*(k-1-window.startRow)), panelWidth+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1 - window.startRow)), textColor, 0.45, chaletlondon, "left", "center",false,true,false,true)
        local state = "□"
        if (v[1] == "check") then
        textColor = tocolor(255, 255, 255, 255)
         _color = "#ffffff"
        if (k ~= currentUse) then
            textColor = tocolor(255, 255, 255, 255)
            _color = "#ffffff"
        else
            textColor = tocolor(0, 0, 0, 255)
            _color = "#000000"
        end
        if (v[3]) then
            state = "▣"
        else
            state = "□"
        end
        dxDrawText(state, panelX+10*relX, currentY+(rowHeight*(k-1- window.startRow)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1- window.startRow)), textColor, 1.0, chaletlondon, "right", "center",false,true,false,true)
       -- dxDrawText("□", panelX+13*relX, currentY+(rowHeight*(k-1)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1)), textColor, 1.0, chaletlondon, "right", "center")
    elseif (v[1] == "select") then 
        local currentUseText = v[5][v[4]] or ""
        if currentUseText then 
            dxDrawText(_color.."< "..currentUseText.._color.." >", panelX+10*relX, currentY+(rowHeight*(k-1- window.startRow)), panelWidth-20*relX+panelX+10*relX, rowHeight+currentY+(rowHeight*(k-1- window.startRow)), textColor, 0.45, chaletlondon, "right", "center",false,true,false,true)
        end
    end
end
end
end
end
end 
--end 
 

addEventHandler("onClientRender", root, render)



function key (key, state)
    if guiGetInputEnabled() then 
        return 
    end
    for _, window in pairs(windows) do 
	if (window.isVisible) then
		if (state) then
		 local v = window.Tabs[currentUse]
			if (v) then
				
				if (v[1] == "button") then
                    if (key == "enter") then
                        playSound("sounds/menunavigate.mp3")
                        enterFunction()
                        triggerEvent("Rage.onTabEnter",localPlayer,currentUse, window.Tabs[currentUse][3])
					end
				elseif (v[1] == "check") then
                    if (key == "enter") then
                        playSound("sounds/menunavigate.mp3")
                        enterFunction()
                        triggerEvent("Rage.onCheckChange",localPlayer,currentUse, window.Tabs[currentUse][4])
					end
				end
			end

			if (key == "arrow_d") then
                if (currentUse < #window.Tabs) then
                    currentUse = currentUse + 1
                    local tab = window.Tabs[currentUse]
                    triggerEvent("Rage.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
                    adjustStartRow(window)
				else
                    currentUse = 1
                    adjustStartRow(window)
                    triggerEvent("Rage.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
				end
				playSound("sounds/menunavigate.mp3")
			elseif (key == "arrow_u") then
				if (currentUse > 1) then
                    currentUse = currentUse - 1
                    triggerEvent("Rage.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
                    adjustStartRow(window)
				else
                    currentUse = #window.Tabs
                    triggerEvent("Rage.onTabChange",localPlayer,currentUse, window.Tabs[currentUse][3])
                    adjustStartRow(window)
                end
				playSound("sounds/menunavigate.mp3")
			elseif (key == "backspace") then
				--v = window.Tabs[currentUse]
                --if (v[1] ~= "input") then
                    
                    playSound("sounds/menuenter.mp3")
                    triggerEvent("Rage.onUseBackspace",localPlayer,window)
                    if window.useBackSpace then 
                        triggerEvent("Rage.onWindowClose",localPlayer,window)
                    DeletePool(_)
                    end 
                    
            --	end
            
                elseif(key == "arrow_l") then
                    if  v[1] == "select" then 
                   
                    if (v[4] > 1) then
                        v[4] = v[4] - 1
                        playSound("sounds/menunavigate.mp3")
                        triggerEvent("Rage.onSelectChange",localPlayer,currentUse, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                    else
                        v[4] = #v[5]
                        playSound("sounds/menunavigate.mp3")
                        triggerEvent("Rage.onSelectChange",localPlayer,currentUse, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                    end
                end
                elseif (key == "arrow_r") then 
                   if  v[1] == "select" then 
                   
                    if (v[4] < #v[5]) then
                    v[4] = v[4] + 1
                    playSound("sounds/menunavigate.mp3")
                    triggerEvent("Rage.onSelectChange",localPlayer,currentUse, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
				else
                    v[4] = 1
                    playSound("sounds/menunavigate.mp3")
                    triggerEvent("Rage.onSelectChange",localPlayer,currentUse, window.Tabs[currentUse][5][window.Tabs[currentUse][4]])
                end
            end
				--playSound("sounds/menunavigate.mp3")

			end
		end
	end
end
end 
addEventHandler("onClientKey", root, key)





addEventHandler("onClientKey", getRootElement(), function(btn, state)
    for _, window in pairs(windows) do  
    if  window.isVisible then 
    if btn == "arrow_d" and state == true then
        cancelEvent()
    end
    if btn == "arrow_u" and state == true then
        cancelEvent()
    end
    if btn == "arrow_r" and state == true then
        cancelEvent()
    end
    if btn == "arrow_l" and state == true then
        cancelEvent()
    end
    if btn == "enter" and state == true then
        cancelEvent()
    end
end
end 
end)





function CreatePool(_title,_stitle,_image,useBackSpace,visibleRows)
    currentUse = 1
    visibleRows = tonumber(visibleRows) or 6

    if #windows ~= 0 then 
        windows = {}
    end
    
    if not _title then return outputDebugString("unable to get menu title") end 
    local id = 1 
     _image = _image or "images/NORMALE.png"
     _stitle = _stitle or ""
     _useBackSpace = useBackSpace

     table.insert(windows,{

      title = _title;
      title_image = _image;
      title_2 = _stitle;
      isVisible = true;
      useBackSpace = _useBackSpace;
      Tabs = {};
      startRow = 1;
      iVisibleRow = visibleRows;
        

     }
    )

    for _, window in ipairs(windows) do 
        if window.title == _title and window.title_image == _image and window.title_2 == _stitle and window.isVisible == true and window.useBackSpace == window._useBackSpace and window.Tabs == {} then 
            id = _ 
        end
    end
    showChat(false)
  return id

end


function setVisible(windowID,bool)
    windows[tonumber(windowID)].isVisible = bool
    showChat(bool)
end


function addTab(windowID,tabType, tabText,tabEvent,selectTable,descr)
local id
descr = descr or false
selectTable = selectTable or {}
    local w = windows[tonumber(windowID)].Tabs
    if w then 
        table.insert( w,{tabType, tabText, tabEvent,1,selectTable,descr} )
    end
	
	 for _, window in ipairs(windows) do 
       for id, tab in ipairs(window.Tabs) do 
          if tab[1] == tabType and tab[2] == tabText then 
		   _id = id 
		   end
		end
	end
	return _id 
    
end



function DeletePool (id, showChatt)
    windows[id] = nil 

    showChat(true)
     
end


    
function DeleteTab (wind,id)
    return table.remove(windows[tonumber(wind)].Tabs[tonumber(id)])
end


function GetShowingPools()
    local tableOBJ = {}
 for _, wind in ipairs(windows) do 
    if wind.isVisible then 
        table.insert(tableOBJ, wind)
    end
 end
   return tableOBJ
end



function GetMenuID(_wind)
   local id
    for _, wind in ipairs(windows) do 
        if wind == _wind or wind.title == _wind then 
            id = _ 
        end
    end
   return id
end





function GetCurrentTab()

    return currentUse

end




function GetCurrentSelect(window,tab)

    return windows[tonumber(window)].Tabs[tonumber(tab)][4]

end




function enterFunction ()
	--if not cursorUsed then cursorUsed = false end
	for _ , window in ipairs(windows) do 
	v = window.Tabs[currentUse]
	if (v[1] == "button") then
		triggerEvent("Rage.onButtonEnter", localPlayer,window,v)
	elseif (v[1] == "check") then
		
            v[4] = not v[4]
            triggerEvent("Rage.onCheckEnter", localPlayer,window,v)
            
    elseif (v[1] == "select") then 
        triggerEvent("Rage.onSelectEnter", localPlayer,window,v)
    end
	end
end



function adjustStartRow(window)
	if (currentUse > (window.startRow + window.iVisibleRow- 1)) then
		window.startRow = currentUse - window.iVisibleRow + 1

        
	elseif (currentUse < window.startRow) then
		window.startRow = currentUse
        
        
        
	end
end


function ClearPool(pool)
    pool = pool or 1

    windows[pool].Tabs = {};

end