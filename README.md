# TimeLine

![](https://github.com/canisminor1990/ffxiv-timeline/raw/master/tools/preview3.png)

- **Q1:** 使用 `Hojoring.Timeline` 不兼容 `FZ.Timeline`
- **Q2:** `Hojoring.Timeline` 为新整合版自带，即 `SpecialSpellTimer`，功能插件 > 计时器字幕 > 时间轴
- **Q3:**  FZ.Timeline 已淘汰，不再更新维护 txt 时间轴
- **Q4:** 窗口不显示的，检查X,Y坐标是否超出显示器范围
- **Q5:** 反馈问题时，请附带时间轴版本号(并检查自己的版本号是否为最新)
- **Q6:** 触发时间轴，必须使用 **倒计时** 开战，确保开全聊天框中的战斗日志，**非战斗中敌人** 也得勾选

## 使用

![](https://github.com/canisminor1990/ffxiv-timeline/raw/master/tools/preview2.png)


#### 安装

<img src="https://github.com/canisminor1990/ffxiv-timeline/raw/master/tools/preview.png" witdh="280px" />

- 关闭ACT
- 下载[时间轴更新工具](https://github.com/canisminor1990/ffxiv-timeline/raw/master/tools/updater.zip)
- 将更新工具放入**ACT根目录**中 ( 与 `Advanced Combat Tracker.exe` 同级 )
- 启动更新程序
- 重启ACT > 功能插件 > 计时器字幕 > 时间轴

## 编写时间轴

- [语法说明](doc.md)
- 播报时间调整

```xml
<!-- -4为提前4秒播报，可按需更改 -->
<default target-element="Activity" target-attr="notice-o" value="-4"/>
```

<br />

## Link

- NGA Timeline: <http://bbs.ngacn.cc/read.php?tid=12766323>
- NGA ACT: <http://bbs.ngacn.cc/read.php?tid=12526945>
- Github: <https://github.com/canisminor1990/ffxiv-timeline>
- Coding: <https://coding.net/u/canisminor1990/p/ffxiv-timeline>

<br />

## Contributors
- **更新器:** [FanHua](https://github.com/imfanhua)


## Copyright

- **Author:** [CanisMinor](https://github.com/canisminor1990)
- **ID:** 男孩纸榨汁机(紫水)
- **E-Mail:** <i@canisminor.cc>
- **讨论群:** 246243038
- **License:** MIT