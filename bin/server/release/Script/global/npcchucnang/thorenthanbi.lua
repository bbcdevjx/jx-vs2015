--hoangnhk
NEED_ROOM_EMPTY = "Hµnh trang ph¶i cã ®ñ 2x4 « trèng."
function main()
	Say(14808,3,
        "Phôc håi trang bŞ tæn h¹i/tonhai",
		"Kh¶m b»ng vËt quı T©y vùc/kham",
		"KĞt thóc ®èi tho¹i!/no")
end

function tonhai()
	GiveItemUI("Phôc håi trang bŞ tæn h¹i","H·y ®Æt trang bŞ tæn h¹i cña ng­¬i vµo ®©y. Mçi lÇn chØ ®­îc 1 c¸i th«i. Chi phİ cÇn cã 5 tiÒn ®ång.","checkdoi")
end;

function kham()
	Say(15459,3,
        "N©ng cÊp trang bŞ /nangcap",
		"Gi¶m ®¼ng cÊp trang bŞ/giamcap",
		"Tho¸t/no")
end

function nangcap()
	PutTremble("§Æt trang bŞ xanh hoÆc tr¾ng vµo ®©y, trang bŞ t¹o ra sÏ t¨ng 1 cÊp víi ma ph¸p kh«ng thay ®æi.","y/checknangcap","n/no")
end;

function giamcap()
	PutTremble("§Æt trang bŞ xanh hoÆc tr¾ng vµo ®©y, ®¼ng cÊp trang bŞ sÏ gi¶m 1. Thuéc tİnh ma ph¸p kh«ng ®æi.","y/checkgiamcap","n/no")
end;

function no()
end
