Include("\\script\\lib\\worldlibrary.lua")

function main(nItemIndex)

	local G,D,P,nLevel = FindItemEx(nItemIndex);

	if (G ~= 6) then
		return 0;
	end
	
	if CheckRoom(2,3) ==0 then
		Say("Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 6 « trë lªn nhÐ!", 1, "§­îc råi./no");
		return 0;
	end

	if D == 2410 then
		AddItemID(AddItem(0,4,195,0,0,5,0,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end	
	
	if D == 2401 then
		AddItemID(AddItem(0,6,2221,0,0,5,0,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end	
	
	
	if D == 2344 or D == 2345 or D == 2346 or D == 2349 or D == 2348 then
		chonnguhanh(nItemIndex,D)
		return 1;
	end

	if D == 2337 then
		AddItemID(AddItem(0,0,10,5,2,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end
	
	if D == 2338 then
		AddItemID(AddItem(0,0,10,5,4,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end
	
	if D == 2339 then
		AddItemID(AddItem(0,0,10,5,3,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end
	
	if D == 2340 then
		AddItemID(AddItem(0,0,10,5,1,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end	
	
	if D == 2341 then
		AddItemID(AddItem(0,0,10,5,5,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end	
	
	if D == 2342 then
		AddItemID(AddItem(0,0,10,6,1,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end

	if D == 2343 then
		AddItemID(AddItem(0,0,10,7,1,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end
	
	if D == 2405 then
		AddItemID(AddItem(0,0,10,8,1,5,0));
		RemoveItem(nItemIndex,1);
		return 0;
	end

	return 1
end


function chonnguhanh(nItemIndex,nD)
	local tbTaskSay = {"Xin h·y chän ngò hµnh",
						format("Kim/nhanvp(%d,%d,%d)", nItemIndex,nD, 0),
						format("Méc/nhanvp(%d,%d,%d)", nItemIndex,nD, 1),
						format("Thñy /nhanvp(%d,%d,%d)", nItemIndex,nD, 2),
						format("Háa/nhanvp(%d,%d,%d)", nItemIndex,nD, 3),
						format("Thæ /nhanvp(%d,%d,%d)", nItemIndex,nD, 4),
					  };
					  
	CreateTaskSay(tbTaskSay);
end

function nhanvp(nItemIndex,nD, nSeries)
	if ConsumeItem(1,0,6,nD) ~= 1 then
		Msg2Player("KhÊu trõ ®¹o cô thÊt b¹i")
		return
	end
	
	if nD == 2344 then
		AddItemID(AddItem(0,0,2,28,3,nSeries,0));
		return
	end	
	
	if nD == 2345 then
		AddItemID(AddItem(0,0,2,28,6,nSeries,0));
		return
	end	

	if nD == 2346 then
		AddItemID(AddItem(0,0,2,28,2,nSeries,0));
		return
	end	
		
	if nD == 2347 then
		AddItemID(AddItem(0,0,2,28,5,nSeries,0));
		return
	end	

	if nD == 2348 then
		AddItemID(AddItem(0,6,1,400,90,nSeries,0));
		AddItemID(AddItem(0,6,1,400,90,nSeries,0));
		return
	end	
end
