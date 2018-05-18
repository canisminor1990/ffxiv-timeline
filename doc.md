# Hojoring Timeline

语法文档

- [头部申明](#头部申明)
- [本体部分](#本体部分)
	- [`<a/>`](#a)
	- [`<t/>`](#t)
	- [`<t><load/></t>`](#tloadt)
	- [`<t/><v-notice/></t>`](#tv-noticet)
	- [`<t/><i-notice/></t>`](#ti-noticet)
	- [`<s/>`](#s)
	- [`<default/>`](#default)
- [Razor](#aspnet-razor)
	- [`全局变量`](#全局变量)

<br />

## 头部申明

```xml
<?xml version="1.0" encoding="utf-8"?>
<timeline>
    <name>罗波那歼灭战</name>
    <rev>1.0.0</rev>
    <description>时间轴说明</description>
    <zone>罗波那歼灭战</zone>
    <locale>CN</locale>
    ...
</timeline>
```

| name             | type   | desc                                                |
| ---------------- | ------ | --------------------------------------------------- |
| `<name/>`        | string | 时间轴名称                                          |
| `<rev/>`         | string | 时间轴版本号                                        |
| `<description/>` | string | 时间轴说明                                          |
| `<zone/>`        | string | 时间轴区域，用于自动匹配时间轴，` {GLOBAL}`时为全局 |
| `<locale/>`      | string | 语言，国服为CN                                      |

<br />

## 本体部分

```xml
<timeline>
    ...
    <entry>P1</entry>
    <start>0039:战斗开始！</start>
    ...
</timeline>
```

| name       | type   | desc                                     |
| ---------- | ------ | ---------------------------------------- |
| `<entry/>` | string | 战斗开始跳转，跳转对应 `<a name="xxx"/>` |
| `<start/>` | string | 战斗开始日志匹配                         |

<br />

### `<a/>`

> activity, 活动

```xml
<timeline>
    <a name="a_1"
       time="054"
       text="焰剑"
       sync="罗波那发动了“焰剑”"
       sync-s="-12"
       sync-e="12"
       goto="a_2"
       call="a_2"
       notice="焰剑"
       notice-d="Both"
       notice-o="-6"
       style="HEADER"
       icon="HardAttack.png"
       enabled="true" />
</timeline>
```

| name        | type         | desc                                                        |
| ----------- | ------------ | ----------------------------------------------------------- |
| `name`      | string       | 用于 `goto/call`                                            |
| `time`      | number/mm:ss | 时间轴时间，如存在父级 `<s/>` 则与其对齐                    |
| ` text`     | string       | 时间轴文字，使用`${_name}` 抓取sync中`[name]`内容           |
| ` sync`     | regEx        | 正则匹配日志，用于同步时间轴                                |
| ` sync-s`   | number       | 默认值-12, `sync` 前匹配秒数                                |
| ` sync-e`   | number       | 默认值12, `sync` 后匹配秒数                                 |
| ` goto`     | string       | 跳转指定 `name`                                             |
| ` call`     | string       | 调用指定 `name`                                             |
| ` notice`   | string       | 语音播报内容                                                |
| ` notice-d` | enum         | 默认值Both, Both/Main/Sub , ` TTSYukkuri` 播放设备          |
| ` notice-o` | number       | 默认值-6, 播报提前秒数                                      |
| ` style`    | string       | 样式,  Default/HEADER, 可在` Timeline.master.config` 中定制 |
| ` icon`     | string       | 图片名称，需要扩展名                                        |
| ` enabled`  | bool         | 默认值true, 启用开关                                        |

<br />

### `<t/>`

> trager, 触发器

```xml
<timeline>
    <t name="t_1"
       text="魔灵击 ➜ ${_pc}"
       sync="starts using 魔灵击 on [pc]"
       sync-count="0"
       goto="t_2"
       call="t_2"
       notice="地震"
       notice-d="Both"
       enabled="true" />
</timeline>
```

| name          | type   | desc                                                         |
| ------------- | ------ | ------------------------------------------------------------ |
| `name`        | string | 用于 `goto/call`                                             |
| `text`        | string | 时间轴文字，使用`${_name}` 抓取sync中`[name]`内容            |
| `sync`        | regEx  | 正则匹配日志，用于同步时间轴                                 |
| ` sync-count` | number | 默认值0, 匹配计数器，0每次, 1仅第一次匹配触发, 2仅第二次匹配触发.. |
| ` goto`       | string | 跳转指定 `name`                                              |
| ` call`       | string | 调用指定 `name`                                              |
| ` notice`     | string | 语音播报内容，` auto` 时播报name内容                         |
| ` notice-d`   | enum   | 默认值Both, Both/Main/Sub , ` TTSYukkuri` 播放设备           |
| ` enabled`    | bool   | 默认值true, 启用开关                                         |

<br />

### `<t><load/></t>`

```xml
<timeline>
    <t name="开始" sync="xxxxxxx">
        <load target="P1" truncate="true" />
        <load target="P2" />
        <load target="P3" />
    </t>
</timeline>
```

| name        | type   | desc                                     |
| ----------- | ------ | ---------------------------------------- |
| `<load/>`   |        | 触发器的子元素，出发时加载的 `<s/>` 片段 |
| ` target`   | string | 加载的 `<s/>` 片段名称                   |
| ` truncate` | bool   | 默认值false，是否初始化                  |
| ` enabled`  | bool   | 默认值true, 启用开关                     |

<br />

### `<t/><v-notice/></t>`

```xml
<timeline>
	<t text="魔灵击 ➜ ${_pc}" sync="starts using 魔灵击 on [pc]" notice="地震">
		<v-notice duration="4"
                  style="NOTICE_NORMAL"
                  icon="HardAttack.png" />
	</t>
</timeline>
```

| name                | type   | desc                                                         |
| ------------------- | ------ | ------------------------------------------------------------ |
| `<v-notice/>`       |        | 触发时显示消息浮层                                           |
| ` text`             | string | 通知内容，` \n` 换行, `{text}` 调用父级text, `{notice}`调用父级notice |
| ` duration`         | number | 默认值3, 持续时间                                            |
| ` duration-visible` | bool   | 默认值true, 通知重叠时是否可见                               |
| ` order`            | number | 通知顺序                                                     |
| ` style`            | string | 样式,  NOTICE/ NOTICE_NORMAL                                 |
| ` icon`             | string | 图片名称，需要扩展名                                         |
| ` enabled`          | bool   | 默认值true, 启用开关                                         |

<br />

### `<t/><i-notice/></t>`

```xml
<timeline>  
    <t name="to Phase1" sync="xxxxx">
        <i-notice image="Sample.png"
                  duration="5"
                  scale="1.0"
                  left="500"
                  top="100" />
    </t>
</timeline>
```

| name          | type   | desc                                       |
| ------------- | ------ | ------------------------------------------ |
| `<i-notice/>` |        | 触发时显示图片                             |
| `image`       | string | 图片名称，调用` resources\images` 下方图片 |
| ` duration`   | number | 默认值5, 持续时间                          |
| ` scale`      | number | 默认值1.0, 缩放倍率                        |
| ` left`       | number | 默认值-1, 定位                             |
| ` top`        | number | 默认值-1, 定位                             |
| ` enabled`    | bool   | 默认值true, 启用开关                       |

<br />

### `<s/>`

> symbol, 组件

```xml
<timeline>  
    <s name="p2">
        <a time="00:29" text="乾坤一掷" notice="乾坤一掷" />
        <a time="00:37" text="咒缚雷" notice="咒缚雷" />
        <a time="00:06" text="风雷波动" notice="风雷波动" />
        <t sync="Added New Combantant 白帝" goto="p3" />
    </s>
</timeline>
```

| name      | type   | desc                 |
| --------- | ------ | -------------------- |
| `<s/>`    |        | 子元素`<a/>`, `<t/>` |
| `name`    | string | 用于 `goto/call`     |
| `enabled` | bool   | 默认值true, 启用开关 |

<br />

### `<default/>`

> 全局默认值设置

```xml
<timeline>
    <default target-element="Activity"
             target-attr="notice-o"
             value="-3" />
</timeline>
```

| name              | type   | desc                                   |
| ----------------- | ------ | -------------------------------------- |
| ` target-element` | enum   | Activity对应`<a/>`,  Trigger对应`<t/>` |
| ` target-attr`    | string | 需要设置的attr名                       |
| ` value`          | string | 设置的默认值                           |
| ` enabled`        | bool   | 默认值true, 启用开关                   |

<br />

## ASP.NET Razor

支持完整[Razor语法](https://docs.microsoft.com/zh-cn/aspnet/core/mvc/views/razor?view=aspnetcore-2.1)

```xml
@using ACT.SpecialSpellTimer.RaidTimeline
@{
	var data = Model as TimelineRazorModel;

	// Zone过滤
    if (Model.Zone == "Sigmascape") {}
	if Model.InZone(["xxx", "xxx"]){}

	// Job/Role过滤
	if (Model.Player.InJob("PLD", "WAR", "DRK")) {}
	if (Model.Player.InRole("Healer")) {}

	// 引入Json文件
	Model.ParseJsonFile("./path")
}
```

<br />

### EX:

```xml
@{var sign = "made by Canisminor"}
<timeline>
    <description>@sign</description>
</timeline>
```

<br />

### 全局变量

```yaml
LT     : @(data.LT)
Zone   : @(data.Zone)
Locale : @(data.Locale)

Player.Number : @(data.Player.Number)
Player.Name   : @(data.Player.Name)
Player.Job    : @(data.Player.Job)
Player.Role   : @(data.Player.Role)

Party :
    Party[0].Number : @(data.Party[0].Number)
    Party[0].Name   : @(data.Party[0].Name)
    Party[0].Job    : @(data.Party[0].Job)
    Party[0].Role   : @(data.Party[0].Role)

    Party[1].Number : @(data.Party[1].Number)
    Party[1].Name   : @(data.Party[1].Name)
    Party[1].Job    : @(data.Party[1].Job)
    Party[1].Role   : @(data.Party[1].Role)

Party[2...8]: more...

Job  : ["PLD", "WAR", "DRK", "WHM", "SCH", "AST"...]
Role : ["Tank", "Healer", "MeleeDPS", "RangeDPS", "MagicDPS", "Crafter", "Gatherer"]
```

