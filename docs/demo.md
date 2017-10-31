# 须佐之男歼殛战 - 须佐之男

```
# 须佐之男歼殛战 - 须佐之男
# By CanisMinor

################ TTS #####################

alertall "停手判定" before 3 sound "tts 停手判定"
alertall "水圈" before 3 sound "tts 水圈"
alertall "雷云出现" before 2 sound "tts 雷云出现"
alertall "雷标记" before 6 sound "tts 雷标记"
alertall "定身雷" before 6 sound "tts 定身雷"

alertall "[G]水泡炸弹" before 0 sound "tts 水泡炸弹"
alertall "[G]水泡炸弹 + 夹缝分摊" before 0 sound "tts 水泡炸弹 夹缝分摊 连招"
alertall "[G]水泡炸弹 + 水圈" before 0 sound "tts 水泡炸弹 水圈 连招"
alertall "[G]水泡炸弹 + 水圈x2" before 2 sound "tts 水泡炸弹 双重水圈 连招"

alertall "[G]夹缝分摊" before 2 sound "tts 击退点名 夹缝分摊"

alertall "[T]强击" before 3 sound "tts T死刑 开减伤"
alertall "[T]破浪斩 > 换T" before 3 sound "tts T死刑 读条换T"
alertall "[T]副T撞球" before 0 sound "tts 副T撞球"
alertall "[T]换T撞球" before 0 sound "tts 换T判定"


alertall "[G]雷标记 + 夹缝分摊" before 2 sound "tts 雷标记 夹缝分摊 连招"
alertall "[G]雷标记 + 水圈x2 + 夹缝分摊" before 2 sound "tts 雷标记 双重水圈 夹缝分摊 连招"

alertall "[H]全屏x2" before 2 sound "tts 2连全屏AOE"
alertall "[H]全屏x3" before 2 sound "tts 3连全屏AOE"

alertall "[G]召唤石牢" before 2 sound "tts 召唤石牢"

alertall "[EGI]P1 热身阶段 ##" before 2 sound "tts P1 热身阶段"
alertall "[EGI]P2 对刀阶段 ##" before 2 sound "tts P2 对刀阶段"
alertall "[EGI]P3 最终阶段 ##" before 2 sound "tts P3 最终阶段"

################ Config ################

hideall "[EGI]重置 ##"

################ Main ################

0 "[EGI]重置 ##" sync /Removing combatant 须佐之男/ window 10000 jump 0

# P1 热身阶段
1 "[EGI]P1 热身阶段 ##" sync /欢庆吧！跳舞吧！/ window 10000
10 "[T]强击" sync /须佐之男发动了“强击”/
##
13 "[G]水泡炸弹" sync /须佐之男发动了“祸泡附身”/
19 "停手判定"
##
32 "[G]夹缝分摊"
37 "八咫镜" sync /须佐之男发动了“八咫镜”/
38 "断海" duration 5 sync /须佐之男正在发动“断海”/
##
49 "[T]强击" sync /须佐之男发动了“强击”/
##
52 "[G]水泡炸弹 + 水圈"
52 "祸泡附身" sync /须佐之男发动了“祸泡附身”/
56 "水圈" duration 3 sync /须佐之男正在发动“螺旋海峡”/
58 "停手判定"
##
70 "雷云出现"
72 "[G]夹缝分摊"
78 "八咫镜" sync /须佐之男发动了“八咫镜”/
79 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/
79 "断海" duration 5 sync /须佐之男正在发动“断海”/
##
89 "[T]强击" sync /须佐之男发动了“强击”/

# P2 对刀阶段
94 "[EGI]P2 对刀阶段 ##" sync /有意思，真有意思！/ window 10000
118 "天之丛云" sync /Added new combatant 天之丛云/ window 10
118 "[T]副T撞球"
118 "撞球 x4"
##
200 "天之丛云" sync /Added new combatant 天之丛云/ window 80, 0
200 "[T]换T撞球"
200 "撞球 x4"

# P3 最终阶段
300 "[EGI]P3 最终阶段 ##" sync /哇啊啊啊！/ window 10000
304 "[H]全屏AOE"
##
321 "[T]破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/ window 10
##
333 "雷标记" sync /须佐之男发动了“闪电”/
338 "雷标记" sync /须佐之男发动了“闪电”/
344 "雷标记" sync /须佐之男发动了“闪电”/
349 "雷标记" sync /须佐之男发动了“闪电”/
##
355 "[H]全屏x2" duration 3 sync /须佐之男正在发动“祈请”/ window 10
359 "祈请 (1)"
361 "祈请 (2)"
##
367 "[G]夹缝分摊"
367 "雷云出现"
375 "八咫镜" sync /须佐之男发动了“八咫镜”/
375 "断海" duration 5 sync /须佐之男正在发动“断海”/
375 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/
##
385 "[T]破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/
##
392 "[G]雷标记 + 雷云"
397 "雷标记" sync /须佐之男发动了“闪电”/
403 "雷云" duration 2 sync / 雷云正在发动“云间放电”/
403 "雷标记" sync /须佐之男发动了“闪电”/
408 "雷标记" sync /须佐之男发动了“闪电”/
414 "雷标记" sync /须佐之男发动了“闪电”/
##
416 "[H]全屏x3" duration 3 sync /须佐之男正在发动“祈请”/
421 "祈请 (1)"
423 "祈请 (2)"
425 "祈请 (3)"
##
431 "[G]召唤石牢" sync /须佐之男发动了“岩户隐”/
441 "岩户闭合 (攻击最后一个)" duration 15
443 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
##
448 "[T]破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/
##
459 "[G]定身雷"
465 "定身雷" sync /须佐之男发动了“闪电”/
472 "定身雷" sync /须佐之男发动了“闪电”/
478 "定身雷" sync /须佐之男发动了“闪电”/
485 "定身雷" sync /须佐之男发动了“闪电”/
##
487 "[H]全屏x3" duration 3 sync /须佐之男正在发动“祈请”/
491 "祈请 (1)"
493 "祈请 (2)"
495 "祈请 (3)"
##
502 "[G]水泡炸弹 + 夹缝分摊"
502 "祸泡附身" sync /须佐之男发动了“祸泡附身”/
508 "停手判定"
510 "八咫镜" sync /须佐之男发动了“八咫镜”/
510 "断海" duration 5 sync /须佐之男正在发动“断海”/
##
517 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
##
525 "[T]破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/
##
535 "[G]定身雷"
541 "定身雷" sync /须佐之男发动了“闪电”/
547 "定身雷" sync /须佐之男发动了“闪电”/
554 "定身雷" sync /须佐之男发动了“闪电”/
560 "定身雷" sync /须佐之男发动了“闪电”/
##
563 "[H]全屏x3" duration 3 sync /须佐之男正在发动“祈请”/
568 "祈请 (1)"
570 "祈请 (2)"
572 "祈请 (3)"
##
574 "[G]水泡炸弹 + 水圈x2"
574 "祸泡附身" sync /须佐之男发动了“祸泡附身”/
578 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
581 "停手判定"
583 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
##
593 "[T]破浪斩 > 换T" duration 4 sync /须佐之男正在发动“破浪斩”/
##
601 "[G]雷标记 + 水圈x2 + 夹缝分摊"
604 "雷云出现"
605 "雷标记" sync /须佐之男发动了“闪电”/
607 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
611 "雷标记" sync /须佐之男发动了“闪电”/
611 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/
616 "雷标记" sync /须佐之男发动了“闪电”/
617 "水圈" duration 2 sync /须佐之男正在发动“螺旋海峡”/
622 "雷标记" sync /须佐之男发动了“闪电”/
##
627 "[G]夹缝分摊"
632 "八咫镜" sync /须佐之男发动了“八咫镜”/
633 "云间放电" duration 2 sync / 雷云正在发动“云间放电”/
633 "断海" duration 5 sync /须佐之男正在发动“断海”/
##
641 "[H]全屏x3" duration 3 sync /须佐之男正在发动“祈请”/
645 "祈请 (1)"
647 "祈请 (2)"
649 "祈请 (3)"
##
656 "[G]召唤石牢" sync /须佐之男发动了“岩户隐”/ window 100 jump 431
```