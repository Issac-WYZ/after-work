# PDR 0.1: 下班以后

## 项目概述

《下班以后》是一款 2D 像素风现代生活模拟游戏。玩家扮演普通城市打工人，从出租屋、公司和便利店组成的最小日常场景开始，体验工作、消费、休息和第二天循环。

0.1 版本目标不是做完整生活模拟，而是验证最小日常闭环是否成立。

## 长期目标

长期目标是扩展为现代题材开放城市生活模拟游戏。玩家可以在城市中自由安排生活，逐步接触兼职、学习、社交、装修、搬家、跳槽、自由职业、摆摊、开店、创业、城市探索和关系建立等系统。

长期目标不进入 0.1 实现范围，只作为架构和内容规划参考。

## 0.1 版本目标

0.1 只实现一个最小可玩的现代日常闭环：

```text
起床 -> 出租屋 -> 去公司 -> 工作小游戏 -> 获得工资 -> 去便利店买东西 -> 回家睡觉 -> 第二天
```

该版本完成后，玩家应能从第一天早上开始，完成一次上班、赚钱、消费、睡觉并进入第二天的完整流程。

## 核心循环

1. 玩家从 Apartment 起床。
2. 玩家通过交互点前往 Office。
3. 玩家在 Office 与工位交互，进入工作小游戏。
4. 玩家完成 5 次正确输入，获得工资。
5. 玩家前往 ConvenienceStore。
6. 玩家购买便当、咖啡或甜品。
7. 玩家回到 Apartment。
8. 玩家与床交互睡觉。
9. Day 增加，Time 回到 07:00，进入第二天。

## 功能范围

### 场景

- Apartment：出租屋。
- Office：公司。
- ConvenienceStore：便利店。

### 玩家

- WASD / 方向键移动。
- 简单碰撞。
- 摄像机跟随玩家。
- 基础交互输入。

### 场景切换

- 通过门口或交互点切换场景。
- 不做真实城市大地图。

### 全局状态

- Day
- Time
- Money
- Energy
- Mood
- Stress

### 工作系统

- 在公司点击工位进入工作小游戏。
- 屏幕出现方向键提示。
- 玩家按对后增加工作进度。
- 完成 5 次正确输入后获得工资 80。
- 工作完成后：Energy -30，Stress +20，Time 18:00。

### 便利店购买系统

- 便当：Money -20，Energy +30。
- 咖啡：Money -10，Energy +10，Stress +5。
- 甜品：Money -15，Mood +20。

### 睡觉系统

- 在出租屋点击床睡觉。
- 睡觉后 Day +1。
- Time 回到 07:00。
- Energy 恢复到 100。
- Stress -15，最低不低于 0。
- Mood 根据 Stress 做轻微调整。

### UI

- 显示 Day。
- 显示 Time。
- 显示 Money。
- 显示 Energy。
- 显示 Mood。
- 显示 Stress。
- 状态变化后 UI 立即更新。

## 美术资源原则

- 0.1 到 0.3 只使用 placeholder 占位素材，不追求正式美术。
- 占位素材统一放在 `assets/placeholder/`。
- 0.1 不引入正式美术素材。
- 0.1 不引入版权不清楚的素材。
- 任何第三方素材必须记录来源和许可证。
- 正式素材后续放入 `assets/art/`。
- 音效和音乐后续放入 `assets/audio/`。
- 占位素材和正式素材不能混放。

正式美术规划不进入 0.1 实现范围。0.4 阶段开始制定正式美术规范，包括像素规格、角色比例、Tile 尺寸、UI 风格、命名规范和资源导入规范。

0.5 之后逐步替换正式素材，优先顺序为：

1. 主角
2. 出租屋
3. UI
4. 公司
5. 便利店
6. NPC
7. 城市地图

## 明确不做范围

0.1 不做以下内容：

- 开放世界
- 大地图
- NPC
- 剧情
- 存档
- 房间装修
- 技能系统
- 多职业
- 复杂美术
- 复杂音效
- 天气
- 事件系统
- 恋爱
- 创业
- 自由职业
- 手机系统
- 任务系统
- 真实通勤系统

## 初始状态数值

| 状态 | 初始值 |
| --- | --- |
| Day | 1 |
| Time | 07:00 |
| Money | 100 |
| Energy | 100 |
| Mood | 60 |
| Stress | 10 |

## 三个场景

### Apartment

职责：

- 作为每日开始地点。
- 提供床交互。
- 提供前往公司和便利店的交互入口。

0.1 中不做：

- 房间装修。
- 多家具系统。
- 存档点。

### Office

职责：

- 提供工位交互。
- 进入工作小游戏。
- 工作完成后结算工资和状态变化。

0.1 中不做：

- 同事 NPC。
- 职位系统。
- 多种工作内容。

### ConvenienceStore

职责：

- 提供商品购买。
- 支持便当、咖啡、甜品三种商品。
- 购买后改变 Money、Energy、Mood、Stress。

0.1 中不做：

- 店员 NPC。
- 商品库存。
- 复杂购物 UI。

## 核心系统

### GameState

管理日期、时间、金钱、体力、心情和压力。所有状态修改应通过统一接口完成，并在状态变化后通知 UI。

### SceneManager

统一管理场景切换。交互物不应直接硬编码加载目标场景，而应通过 SceneManager 请求切换。

### PlayerController

负责玩家移动、碰撞、摄像机跟随和基础交互触发。PlayerController 不直接处理工作、购买或睡觉结算。

### Interactable

定义统一交互接口。后续门、床、工位、商品和 NPC 都应基于该接口扩展。

### ActionSystem

统一处理会改变 GameState 的行为，例如工作结算、购买商品、睡觉。

### UIManager

监听 GameState 状态变化并刷新 HUD。0.1 只做基础状态显示。

### WorkMiniGame

负责方向键反应小游戏。完成 5 次正确输入后通知 ActionSystem 进行工作结算。

### ShopSystem

管理便利店商品和购买逻辑。0.1 可使用固定商品数据，后续预留数据驱动扩展。

## 0.1 验收标准

- 项目可在 Godot 4.6.x stable 中打开。
- 玩家可以在 Apartment 中移动。
- 玩家移动有基础碰撞。
- 摄像机跟随玩家。
- HUD 显示 Day、Time、Money、Energy、Mood、Stress。
- 玩家可以在 Apartment、Office、ConvenienceStore 之间切换。
- 玩家可以在 Office 完成工作小游戏。
- 完成工作后 Money +80，Energy -30，Stress +20，Time 变为 18:00。
- 玩家可以在 ConvenienceStore 购买三种商品。
- 商品购买后的状态变化符合设计。
- 玩家可以在 Apartment 睡觉进入第二天。
- 睡觉后 Day +1，Time 回到 07:00，Energy 恢复，Stress 降低。
- UI 在状态变化后立即更新。
- 0.1 只使用 placeholder 占位素材。
- 没有写死 macOS 或 Windows 专属路径。
- 项目资源使用 `res://`。
- 未来用户数据路径使用 `user://`。
- 输入使用 Godot InputMap。
- macOS 和 Windows 导出测试有记录。

## 阶段拆分

### 1. 项目初始化和文档准备

目标：

- 创建项目目录结构。
- 创建 README、ROADMAP、BACKLOG、DEVLOG、AGENTS 和 PDR 文档。
- 不写游戏功能代码。

验收标准：

- 文档文件存在。
- 目录结构清晰。
- 没有新增功能脚本。

建议提交：

- `docs: add initial project planning documents`

### 2. 出租屋场景和玩家移动

目标：

- 创建 Apartment 场景。
- 创建玩家基础移动。
- 增加碰撞和摄像机跟随。

验收标准：

- 玩家可以在 Apartment 中移动。
- 玩家不会穿过基础碰撞。
- 摄像机跟随玩家。

建议提交：

- `feat: add apartment scene and player movement`

### 3. 全局状态系统和 UI

目标：

- 创建 GameState。
- 创建基础状态 HUD。

验收标准：

- HUD 显示 6 个状态。
- 状态变化后 HUD 能刷新。

建议提交：

- `feat: add game state and status hud`

### 4. 场景切换系统

目标：

- 创建 SceneManager。
- 创建交互点切换 Apartment、Office、ConvenienceStore。

验收标准：

- 玩家可以通过交互点切换三个场景。
- 切换后项目仍可运行。

建议提交：

- `feat: add scene transition system`

### 5. 公司场景和工作小游戏

目标：

- 创建 Office 场景。
- 创建 WorkMiniGame。
- 完成工作结算。

验收标准：

- 玩家可进入工作小游戏。
- 连续完成 5 次正确输入后获得工资。
- 状态变化符合 PDR。

建议提交：

- `feat: add office work minigame`

### 6. 便利店场景和购买系统

目标：

- 创建 ConvenienceStore 场景。
- 创建 ShopSystem。
- 支持三种商品购买。

验收标准：

- 三种商品均可购买。
- Money 和状态变化正确。
- UI 立即刷新。

建议提交：

- `feat: add convenience store purchases`

### 7. 睡觉系统和第二天循环

目标：

- 创建床交互。
- 睡觉后进入第二天。

验收标准：

- Day +1。
- Time 回到 07:00。
- Energy 恢复到 100。
- Stress 正确降低且不低于 0。

建议提交：

- `feat: add sleep and next day loop`

### 8. 0.1 整体测试与整理

目标：

- 完整跑通 0.1 日常闭环。
- 整理命名、目录和文档。
- 记录 macOS 和 Windows 导出测试结果。

验收标准：

- 可以完整完成一天循环。
- 没有 0.1 范围外功能。
- 仍然只使用 `assets/placeholder/` 中的占位素材。
- 导出测试记录完整。

建议提交：

- `test: verify v0.1 daily loop`

## 后续扩展预留

0.1 应保持简单，但需要为后续扩展保留方向：

- Interactable 后续可扩展 NPC、商品、家具、门、任务触发点。
- ShopSystem 后续可改为读取数据文件。
- SceneManager 后续可支持进入更多地点。
- GameState 后续可增加健康、饥饿、关系、技能等状态。
- ActionSystem 后续可统一处理学习、兼职、锻炼、娱乐等行为。
- UIManager 后续可扩展菜单、手机、日程和提示系统。

这些预留只体现在命名和职责划分中，不在 0.1 提前实现复杂功能。
