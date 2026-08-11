--hoangnhk
function main(nItemIdx)
	if (GetTongFlag() ~= 0) then
		Msg2Player("§¹i hiÖp ®· cã Bang Héi kh«ng thÓ tiÕn hµnh thao t¸c nµy!");
		return
	end
	Input("on_change_rolename");
end

function on_change_rolename(new_name)
	if (GetName() == new_name) then
		Talk(1, "", "B¹n muèn ®æi tªn g×?")
	else
		if(RenameRole(new_name, "on_rename_rolename") ==0)then
			Talk(1, "", "Tªn b¹n nhËp vµo kh«ng hîp lÖ!");
		elseif(RenameRole(new_name, "on_rename_rolename") ==1)then
			Talk(1, "", "§é dµi tªn chØ tõ 6 ®Õn 12 ký tù!");
		return end;
	end
end

function on_rename_rolename(f)
	if(f==1) then
		OfflineLive();
	else
		Talk(1, "", "Tªn b¹n nhËp vµo ®· tån t¹i!");
	end;
end;