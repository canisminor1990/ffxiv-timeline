# TimeLine

命令一览

```
# xxx - xxx

################ TTS ################
alertall "xxx" before 0 sound "tts xxx"

################ Config ################
hideall "xxx"

################ Main ################
0 "## 重置 ##" sync /Removing combatant xxx/ window 10000 jump 0

# P1 开始
1 "## 开始 ##" sync /xxx/ window 10000
...
```

#### func
- **alertall:** `alertall "xxx" before 0 sound "tts xxx"`
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
alertall "强击" before 3 sound "tts T死刑"
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

## 标签与颜色

**支持列表:**
- [T]
- [H]
- [D]
- [G]

**Tank:**
- [PLD]
- [WAR]
- [DKN]

**Dps:**
- [MNK]
- [DRG]
- [BRD]
- [NIN]
- [BLM]
- [SMN]
- [MCN]

**Heal:**
- [WHM]
- [SCH]
- [AST]

**Other:**
- [EGI]
- [FAIRY]
- [TURRET]