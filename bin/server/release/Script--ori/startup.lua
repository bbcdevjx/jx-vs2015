Include("\\script\\startgame\\thon\\balanghuyen.lua");
Include("\\script\\startgame\\monster\\trainingmap.lua");--add quai' luyen cong



function	main()
Say(1,"Hello!")
	AddNPCEx(1325,10,53,199,199,9,7,"\\script\\hotrothanthu.lua",6,"Qu©n S­ T©n thñ");
	addtrainingnpc()
	AddNPCEx(414,10,53,193,204,9,7);
end;


function AddNPCEx(nId,nLevel, nMap,nX,nY,nOffsetX,nOffsetY,nScript,nCurCamp,sName,nStyle)
	if (nOffsetX==nil) then nOffsetX = 0 end
	if (nOffsetY==nil) then nOffsetY = 0 end	
    	mapindex = SubWorldID2Idx(nMap)
		npcid = nId
    	npclvl = nLevel
if (nStyle==nil) then
    	posx = floor((nX+nOffsetX/10)*8*32)
    	posy = floor((nY+nOffsetY/10)*16*32)
end
if (nStyle~=nil) then
posx =nX
posy=nY
end

	nNpcId = AddNpc(npcid,npclvl,mapindex,posx,posy,1, "Da tau", 1)
	if(nScript~=nil) then
    		SetNpcScript(nNpcId, nScript)
    	end	
    if(nCurCamp~=nil) then	
		SetNpcCurCamp(nNpcId, nCurCamp)
	end
    if(sName~=nil) then	
		SetNpcName(nNpcId, sName)
	end	
	return
end

