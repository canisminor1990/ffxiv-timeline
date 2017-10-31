#TimeLine

```sh
# comment
0 "xxx" duration 0 sync /xxx“xxx”/ window 0,0 jump 0
```

## 自动加载

如果将时间轴文件命名为区域名称，则可以在移动区域后自动加载文件。

```
须佐之男歼殛战.txt
```

## 同步

- `sync` 正则匹配日志
- `duration` 施法时间


```
593 "破浪斩" duration 4 sync /须佐之男正在发动“破浪斩”/ window 2, 2
```

### 增加删除对象

- `Added new combatant`
- `Removing combatant`

### 发动技能

- xxx正在发动“xxx”
- xxx发动了“xxx”

## 误差调整

- `window` 前误差, 后误差

一般为前后误差2秒，默认为5秒

```
window 2, 2
```

### 阶段性调整

一般调阶段时请将误差设为`10000`

```sh
1 "--开始--" sync /欢庆吧！跳舞吧！/ window 10000
...
94 "--Phase 2--" sync /有意思，真有意思！/ window 10000
```

## 跳转

- `jump` 跳转时间

### 循环

```sh
431 "岩户隐" sync /须佐之男发动了“岩户隐”/ window 2, 2
...
656 "岩户隐" sync /须佐之男发动了“岩户隐”/ window 100 jump 431
```

### 重置

- 使用 `Removing combatant` 判断Boss重置
- 如果指定了0秒，将在起始位置进入待机状态。

```sh
0 "--重置--" sync /Removing combatant 须佐之男/ window 10000 jump 0
```

## 提示

```sh
define speaker "tts" "Microsoft Huihui Desktop" 0 100
alertall "强击" before 3 speak "tts" "T死刑"
```

```sh
define alertsound "提示音" "提示音.wav"
alertall "强击" before 3 sound "提示音"
```

## 隐藏

```
hideall "xxx"
```