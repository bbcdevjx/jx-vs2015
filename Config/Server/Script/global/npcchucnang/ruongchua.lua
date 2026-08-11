--hoangnhk
function main(NpcIndex)
	OpenBox();
	local nRevivalid = GetNpcValue(NpcIndex)
	if(nRevivalid ~= nil and nRevivalid > 0) then
	SetRevPos(nRevivalid)
	end
end