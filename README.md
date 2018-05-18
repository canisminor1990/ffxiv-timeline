# TimeLine

![](http://qn.canisminor.cc/2017-11-17-timeline.png)

- **注意1：**使用 `Hojoring.Timeline` 不兼容 `FZ.Timeline`
- **注意2：**`Hojoring.Timeline` 为新整合版自带，即 `SpecialSpellTimer`，功能插件 > 计时器字幕 > 时间轴

## 使用

#### 安装

- 关闭ACT
- 复制 [`resources`](https://github.com/canisminor1990/ffxiv-timeline/raw/master/resources.zip) 文件夹覆盖 `ACT目录/plugin/ACT.Hojoring/resources`
- 重启ACT > 功能插件 > 计时器字幕 > 时间轴 > 打开目录
- 复制 `xxxx.xml` 时间轴文件到目录
- 重载目录

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

## Copyright

- **Author:** CanisMinor
- **ID:** 男孩纸榨汁机(紫水)
- **E-Mail:** <i@canisminor.cc>
- **讨论群:** 246243038
- **License:** MIT