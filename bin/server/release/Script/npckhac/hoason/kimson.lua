--hoangnhk
function main(NpcIndex)
	Say(12251,3,
	"Thµnh lËp bang héi/thanhlap",
	"T×m hiÓu vÒ bang héi/timhieu",
	"§ãng/no")
end;

function thanhlap()
	if(GetTongName() ~= "") then
		Talk(1,"",12263)
	return end
	OpenTong()
end;

function timhieu()
	Talk(5,"",12252,12259,12260,12261,12262)
end;

function no()
end;