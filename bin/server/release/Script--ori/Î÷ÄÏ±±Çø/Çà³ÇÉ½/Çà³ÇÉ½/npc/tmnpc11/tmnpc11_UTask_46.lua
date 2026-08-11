--description: 唐门耿子奇 40级任务
--author: yuanlan	
--date: 2003/3/12



function tmnpc11_UTask_46()

if (HaveItem("蟾蜍的皮") == 1) and (HaveItem("毒蛇的胆") == 1) and (HaveItem("罂粟的壳") == 1) and (HaveItem("毒蝎的尾") == 1) and (HaveItem("僵蚕的头") == 1) then						--已经得到五种药材
	Talk(2, "", "玩家：前辈，这五种就是治疗怪病的药材，师叔说只要吃三次就可以痊愈了。", "耿子奇：太好了！我女儿有救了！谢谢你！谢谢你！多谢谢你师叔，是我误会了他！")
	DelItem("蟾蜍的皮")
	DelItem("毒蛇的胆")
	DelItem("罂粟的壳")
	DelItem("毒蝎的尾")
	DelItem("僵蚕的头")
	SetTask(2, 48)
else
	Talk(3, "", "耿子奇：你真的有办法救我女儿吗？", "玩家：唐野师叔已经告诉了我药方，我正在寻找治疗怪病所需的五种药材。", "耿子奇：太谢谢你了！")
end;
	

end;



	


