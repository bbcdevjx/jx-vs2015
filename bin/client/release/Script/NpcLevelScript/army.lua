--计算NPC属性
--可以计算的属性包括：
--Exp、Life、LifeReplenish、AttackRating、Defense、MinDamage、MaxDamage；
--Level1、Level2、Level3、Level4。



--取得用|分割的参数的函数。

function GetParam(strParam, index)
nLastBegin = 1
for i=1, index - 1 do
nBegin = strfind(strParam, "|", nLastBegin)
nLastBegin = nBegin + 1
end;
num = 1

strnum = strsub(strParam, nLastBegin)
nEnd = strfind(strnum, "|")
if nEnd == nil then 
return strnum
end
str1 = strsub(strnum,1,nEnd -1);
return str1
end;



--入口主函数，第一个参数为NPC等级，等二个参数为数据类型，第三个参数是传入的npcs中的字符串。
--被一个npc单独用的脚本可以不考虑第三个参数的输入。
function GetNpcLevelData(Level, StyleName, ParamStr)
Param1 = GetParam(ParamStr,1);
Param2 = GetParam(ParamStr,2);

result = GetData(Level, Param1, Param2);
return result;
end;

--关键数据的计算函数
function GetNpcKeyData(Level, StyleName, Param1, Param2, Param3)
if (StyleName == "Exp") then
return GetExp(Level, Param1, Param2);
end;

if (StyleName == "Life") then
return GetLife(Level, Param1, Param2);
end;

if (StyleName == "AttackRating") then
return GetAttackRating(Level, Param1, Param2);
end;

if (StyleName == "Defense") then
return GetDefense(Level, Param1, Param2);
end;

if (StyleName == "MinDamage") then
return GetMinDamage(Level, Param1, Param2);
end;

if (StyleName == "MaxDamage") then
return GetMaxDamage(Level, Param1, Param2);
end;

result = Param1 * Level * Level + Param2 * Level + Param3;
return result;
end;

--通用的线性计算公式。
function GetData(Level, Param1, Param2)
result = Param2 * Level + Param1;
return floor(result);
end;

--以下的DataPara1表示线性函数y=kx+b中的b，DataPara2表示k。
--经验值计算公式
function GetExp(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=1
DataPara2=0
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=1
DataPara2=0
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=1
DataPara2=0
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=1
DataPara2=0
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=1
DataPara2=0
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=1
DataPara2=0
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=1
DataPara2=0
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=1
DataPara2=0
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=1
DataPara2=0
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=1
DataPara2=0
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--生命值计算函数
function GetLife(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=50
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=122
DataPara2=8
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=270
DataPara2=30
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=900
DataPara2=35
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=1450
DataPara2=60
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=2100
DataPara2=48
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=2950
DataPara2=54
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=3500
DataPara2=58
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=5050
DataPara2=11
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=6450
DataPara2=11
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--命中率计算函数
function GetAttackRating(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=4
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=250
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=400
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=500
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=600
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=700
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=800
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=900
DataPara2=5
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--闪避率计算函数。
function GetDefense(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=0
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=3
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=150
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=200
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=300
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=400
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=500
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=600
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=800
DataPara2=10
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最小伤害计算函数
function GetMinDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最大伤害计算函数
function GetMaxDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;


