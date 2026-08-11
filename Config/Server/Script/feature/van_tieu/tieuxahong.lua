Include("\\script\\header\\taskid.lua")

function main(nIndex)
	if(GetTask(TASK_NPCVANTIEU) == GetNpcID(nIndex)) then
	AddItemID(AddItem(0,6,4771,0,0,5,0,0))
	DelNpc(nIndex)
	Msg2Player("B¹n ®· ®o¹t l¹i Tiªu Kú. H·y mang vÒ Long M«n tiªu côc nhËn lao phÝ")
	return end
	Msg2Player("Tiªu xa nµy kh«ng cã ý nghÜa g× víi b¹n")
end

function Timeout(nIndex)
	DelNpc(nIndex)
end