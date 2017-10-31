#TimeLine

命令一览

```
# xxx - xxx

################ TTS ################
define speaker "voice" "Microsoft Huihui Desktop" 0 100

################ Config ################
alertall "xxx" before 3 speak "voice" "xxx"
hideall "xxx"

################ Main ################
0 "## 重置 ##" sync /Removing combatant xxx/ window 10000 jump 0

# P1 开始
1 "## 开始 ##" sync /xxx/ window 10000
...
```

#### func
- **define speaker:** `define speaker "voice" "Microsoft Huihui Desktop" 0 100`
- **alertall:** `alertall "xxx" before 3 speak "voice" "xxx"`
- **hideall:** `hideall "xxx"`

#### prop
- **duration:** `duration 5`
- **sync:** `sync /xxx/`
- **window:** `window 2,2`
- **jump:** `jump 0`

<br />

## 自动加载

如果将时间轴文件命名为区域名称，则可以在移动区域后自动加载文件。

```
须佐之男歼殛战.txt
```

<br />

## 同步

- `sync` 正则匹配日志
- `duration` 施法时间


```
666 "破浪斩" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
```

#### 增加删除对象

- `Added new combatant`
- `Removing combatant`

```
666 "天之丛云" sync /Added new combatant 天之丛云/ window 10
```

#### 发动技能

- `xxx正在发动“xxx”`
- `xxx发动了“xxx”`

```
333 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
...
666 "云间放电" duration 2 sync /雷云正在发动“云间放电”/ window 2, 2
```

<br />

## 误差调整

- `window` 前误差, 后误差

一般为前后误差2秒，默认为5秒

```
window 2, 2
```

#### 阶段性调整

一般调阶段时请将误差设为`10000`

```
1 "--开始--" sync /欢庆吧！跳舞吧！/ window 10000
...
666 "--Phase 2--" sync /有意思，真有意思！/ window 10000
```

<br />

## 跳转

- `jump` 跳转时间

#### 循环

```
333 "岩户隐" sync /须佐之男发动了“岩户隐”/ window 2, 2
...
666 "岩户隐" sync /须佐之男发动了“岩户隐”/ window 100 jump 333
```

#### 重置

- 使用 `Removing combatant` 判断Boss重置
- 如果指定了0秒，将在起始位置进入待机状态。

```
0 "--重置--" sync /Removing combatant 须佐之男/ window 10000 jump 0
```

<br />

## 提示

- voice 语音报幕提示

```
define speaker "voice" "Microsoft Huihui Desktop" 0 100
alertall "强击" before 3 speak "voice" "T死刑"
```
- 提示音

```
define alertsound "提示音" "提示音.wav"
alertall "强击" before 3 sound "提示音"
```

<br />

## 隐藏

隐藏不需要的提示，一般可作为T，奶，DPS单独配置用。

```
hideall "xxx"
```

## 完整示例

- 须佐之男歼殛战.txt

```
# 须佐之男歼殛战 - 须佐之男
# By CanisMinor

################ TTS ################

define speaker "voice" "Microsoft Huihui Desktop" 0 100
#define speaker "voice" "Microsoft Hanhan Desktop" 0 100
#define speaker "voice" "Microsoft Lili" 0 100

################ Config #####################

alertall "强击" before 3 speak "voice" "T死刑 开减伤"
alertall "停手判定" before 3 speak "voice" "停手判定"
alertall "水圈" before 3 speak "voice" "水圈"
alertall "雷云出现" before 2 speak "voice" "雷云出现"
alertall "雷标记" before 6 speak "voice" "雷标记"
alertall "定身雷" before 6 speak "voice" "定身雷"

alertall "# 水泡炸弹" before 0 speak "voice" "水泡炸弹"
alertall "# 水泡炸弹 + 夹缝分摊" before 0 speak "voice" "水泡炸弹 夹缝分摊 连招"
alertall "# 水泡炸弹 + 水圈" before 0 speak "voice" "水泡炸弹 水圈 连招"
alertall "# 水泡炸弹 + 水圈x2" before 2 speak "voice" "水泡炸弹 双重水圈 连招"

alertall "# 夹缝分摊" before 2 speak "voice" "击退点名 夹缝分摊"

alertall "# 破浪斩 > 换T" before 3 speak "voice" "T死刑 读条换T"
alertall "# 副T撞球" before 0 speak "voice" "副T撞球"
alertall "# 换T撞球" before 0 speak "voice" "换T判定"


alertall "# 雷标记 + 夹缝分摊" before 2 speak "voice" "雷标记 夹缝分摊 连招"
alertall "# 雷标记 + 水圈x2 + 夹缝分摊" before 2 speak "voice" "雷标记 双重水圈 夹缝分摊 连招"

alertall "# 全屏x2" before 2 speak "voice" "2连全屏AOE"
alertall "# 全屏x3" before 2 speak "voice" "3连全屏AOE"

alertall "# 召唤石牢" before 2 speak "voice" "召唤石牢"

alertall "## P1 热身阶段 ##" before 2 speak "voice" "P1 热身阶段"
alertall "## P2 对刀阶段 ##" before 2 speak "voice" "P2 对刀阶段"
alertall "## P3 最终阶段 ##" before 2 speak "voice" "P3 最终阶段"
################ Main ################

0 "## 重置 ##" sync /Removing combatant 须佐之男/ window 10000 jump 0

# P1 热身阶段
1 "## P1 热身阶段 ##" sync /欢庆吧！跳舞吧！/ window 10000
10 "强击" sync /须佐之男发动了“强击”/ window 2, 2
##
13 "# 水泡炸弹" sync /须佐之男发动了“祸泡附身”/ window 2, 2
19 "停手判定"
##
32 "# 夹缝分摊"
37 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
38 "断海" duration 5 sync /须佐之男正在发动“断海”/ window 2, 2
##
49 "强击" sync /须佐之男发动了“强击”/ window 2, 2
##
52 "# 水泡炸弹 + 水圈"
52 "祸泡附身" sync /须佐之男发动了“祸泡附身”/ window 2, 2
56 "水圈" duration 3 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
58 "停手判定"
##
70 "雷云出现"
72 "# 夹缝分摊"
78 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
79 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/ window 2, 2
79 "断海" duration 5 sync /须佐之男正在发动“断海”/ window 2, 2
##
89 "强击" sync /须佐之男发动了“强击”/ window 2, 2

# P2 对刀阶段
94 "## P2 对刀阶段 ##" sync /有意思，真有意思！/ window 10000
118 "天之丛云" sync /Added new combatant 天之丛云/ window 10
118 "# 副T撞球"
118 "撞球 x4"
##
200 "天之丛云" sync /Added new combatant 天之丛云/ window 80, 0
200 "# 换T撞球"
200 "撞球 x4"

# P3 最终阶段
300 "## P3 最终阶段 ##" sync /哇啊啊啊！/ window 10000
304 "# 全屏AOE"
##
321 "# 破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 10
##
333 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
338 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
344 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
349 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
##
355 "# 全屏x2" duration 3 sync /须佐之男正在发动“祈请”/ window 10
359 "祈请 (1)"
361 "祈请 (2)"
##
367 "# 夹缝分摊"
367 "雷云出现"
375 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
375 "断海" duration 5 sync /须佐之男正在发动“断海”/ window 2, 2
375 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/ window 2, 2
##
385 "# 破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
##
392 "# 雷标记 + 雷云"
397 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
403 "雷云" duration 2 sync / 雷云正在发动“云间放电”/ window 2, 2
403 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
408 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
414 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
##
416 "# 全屏x3" duration 3 sync /须佐之男正在发动“祈请”/ window 2, 2
421 "祈请 (1)"
423 "祈请 (2)"
425 "祈请 (3)"
##
431 "# 召唤石牢" sync /须佐之男发动了“岩户隐”/ window 2, 2
441 "岩户闭合 (攻击最后一个)" duration 15
443 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
##
448 "# 破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
##
459 "# 定身雷"
465 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
472 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
478 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
485 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
##
487 "# 全屏x3" duration 3 sync /须佐之男正在发动“祈请”/ window 2, 2
491 "祈请 (1)"
493 "祈请 (2)"
495 "祈请 (3)"
##
502 "# 水泡炸弹 + 夹缝分摊"
502 "祸泡附身" sync /须佐之男发动了“祸泡附身”/ window 2, 2
508 "停手判定"
510 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
510 "断海" duration 5 sync /须佐之男正在发动“断海”/ window 2, 2
##
517 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
##
525 "# 破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
##
535 "# 定身雷"
541 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
547 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
554 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
560 "定身雷" sync /须佐之男发动了“闪电”/ window 2, 2
##
563 "# 全屏x3" duration 3 sync /须佐之男正在发动“祈请”/ window 2, 2
568 "祈请 (1)"
570 "祈请 (2)"
572 "祈请 (3)"
##
574 "# 水泡炸弹 + 水圈x2"
574 "祸泡附身" sync /须佐之男发动了“祸泡附身”/ window 2, 2
578 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
581 "停手判定"
583 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
##
593 "# 破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
##
601 "# 雷标记 + 水圈x2 + 夹缝分摊"
604 "雷云出现"
605 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
607 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
611 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
611 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/ window 2, 2
616 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
617 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/ window 2, 2
622 "雷标记" sync /须佐之男发动了“闪电”/ window 2, 2
##
627 "# 夹缝分摊"
632 "八咫镜" sync /须佐之男发动了“八咫镜”/ window 2, 2
633 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/ window 2, 2
633 "断海" duration 5 sync /须佐之男正在发动“断海”/ window 2, 2
##
641 "# 全屏x3" duration 3 sync /须佐之男正在发动“祈请”/ window 2, 2
645 "祈请 (1)"
647 "祈请 (2)"
649 "祈请 (3)"
##
656 "# 召唤石牢" sync /须佐之男发动了“岩户隐”/ window 100 jump 431
```