# Devlog

开发日志用于记录每次开发的目标、完成内容、问题和下一步。每个稳定阶段完成后，应补充测试结果和建议提交信息。

## 记录模板

```md
## YYYY-MM-DD

### 今日目标

- TODO

### 完成内容

- TODO

### 测试结果

- TODO

### 遇到的问题

- TODO

### 下一步

- TODO

### 建议提交

- `type: short description`
```

## 2026-05-06

### 今日目标

- 创建项目文档结构。
- 明确 0.1 开发范围、跨平台纪律和阶段拆分。

### 完成内容

- 初始化 README、ROADMAP、BACKLOG、DEVLOG、AGENTS 和 PDR 文档。
- 建立 0.1 版本前期规划。
- 创建最小 Godot 项目配置 `project.godot`。
- 创建 Godot `.gitignore`。
- 创建素材许可证记录文档。
- 创建 0.1 测试清单。
- 初始化本地 Git 仓库并设置远程 `origin`。
- 创建 Apartment 最小场景。
- 创建 Player 场景。
- 创建 PlayerController，支持通过 InputMap 读取移动输入。
- 将主场景设置为 `res://scenes/apartment/Apartment.tscn`。

### 测试结果

- 已执行尾随空白检查，未发现问题。
- 已确认新增场景资源使用 `res://`。
- 已搜索确认未写死 `/Users/`、`C:` 或 `D:` 本地路径。
- 当前环境没有 Godot 命令行，尚未实际启动 Godot 运行测试。

### 遇到的问题

- 当前环境没有可直接调用的 `godot` 或 `godot4` 命令，尚未通过命令行启动验证。

### 下一步

- 使用 Godot 4.6.x stable 打开项目，确认项目配置可加载。
- 在 Godot 编辑器中运行 Apartment 场景，验证玩家移动、碰撞和摄像机跟随。
- 若验证通过，进入第三阶段：GameState 和状态 HUD。

### 建议提交

- `docs: add initial project planning documents`
- `chore: initialize godot project config`
- `feat: add apartment scene and player movement`

## 2026-05-06

### 今日目标

- 在功能分支上实现 0.1 的全局状态系统和基础状态 HUD。
- 保持 `main` 稳定，不直接在主分支开发。

### 完成内容

- 创建分支 `feat/v0.1-game-state-ui`。
- 新增 `GameState` autoload，管理 Day、Time、Money、Energy、Mood、Stress。
- 新增 `StatusHUD` 场景。
- 新增 `UIManager`，监听 `GameState` 并刷新 HUD。
- 将 `StatusHUD` 挂到 Apartment 主场景。

### 测试结果

- 已执行 `git diff --check`，未发现空白错误。
- 已通过 Godot 4.6.2 headless 加载项目。
- 已通过 Godot 4.6.2 headless 运行主场景 2 秒。
- 已确认新增资源路径使用 `res://`。

### 遇到的问题

- `git pull --ff-only` 访问 GitHub 超时，未能完成远程同步检查。
- 本地 `main` 在开分支前保持干净，且与已知 `origin/main` 一致。

### 下一步

- 在 Godot 编辑器中目视确认 HUD 显示初始状态。
- 如果本阶段通过验收，提交并推送 `feat/v0.1-game-state-ui`。
- 下一阶段进入场景切换系统。

### 建议提交

- `feat: add game state and status hud`

## 2026-05-07

### 今日目标

- 实现 0.1 的基础场景切换系统。
- 直接在 `main` 上小步开发，保持每次改动可运行。

### 完成内容

- 新增 `SceneManager` autoload，统一管理 Apartment、Office、ConvenienceStore 场景切换。
- 新增基础 `Interactable` 接口脚本。
- 新增 `SceneTransition` 交互点脚本和共享场景。
- 更新 PlayerController，支持检测附近可交互对象并通过 `interact` 输入触发。
- 新增 MainStreet 小型主街区，作为 Apartment、Office、ConvenienceStore 之间的 hub。
- 新增 Office 空场景。
- 新增 ConvenienceStore 空场景。
- 在 Apartment 中加入前往 MainStreet 的占位交互点。
- 在 MainStreet 中加入前往 Apartment、Office 和 ConvenienceStore 的占位交互点。
- 在 Office 和 ConvenienceStore 中加入返回 MainStreet 的占位交互点。

### 测试结果

- 已执行 `git diff --check`，未发现空白错误。
- 已通过 Godot 4.6.2 headless 运行主场景 2 秒。
- 已通过 Godot 4.6.2 headless 加载 MainStreet 场景。
- 已通过 Godot 4.6.2 headless 加载 Office 场景。
- 已通过 Godot 4.6.2 headless 加载 ConvenienceStore 场景。
- 已确认没有新增正式美术素材，当前仍为几何 placeholder。

### 遇到的问题

- 初版使用 `class_name Interactable` 时，Player 脚本解析早于全局类注册，Godot headless 报类型不可见。
- 已改为路径继承和 duck typing，避免脚本加载顺序影响。

### 下一步

- 在运行窗口中手动测试：玩家走到黄色交互点，按 `E` 切换场景。
- 若手动测试通过，提交 `feat: add scene transition system`。

### 建议提交

- `feat: add scene transition system`

## 2026-05-07

### 今日目标

- 实现 0.1 的 Office 占位工作小游戏。
- 只验证交互、输入、结算和 HUD 刷新链路，不做正式工作玩法设计。

### 完成内容

- 新增 `ActionSystem` autoload，当前只处理工作完成结算。
- 新增 Office 工位交互脚本。
- 新增 `WorkMiniGame` 占位 UI，显示方向提示和 5 次进度。
- 玩家在 Office 靠近工位后可通过交互进入占位工作小游戏。
- 完成 5 次正确方向输入后结算工资和状态变化。

### 测试结果

- 已执行 `git diff --check`，未发现空白错误。
- 已通过 Godot 4.6.2 headless 运行主场景 2 秒。
- 已通过 Godot 4.6.2 headless 加载 Office 场景。
- 已通过临时 headless 场景复现并验证 Apartment 的 `Street` 交互切换不再触发退出错误。

### 遇到的问题

- 临时外部 `--script` 行为测试绕过了项目正常 autoload 编译环境，不适合验证本项目的全局 autoload 交互链路。
- 手动测试发现按 `E` 触发 `Street` 场景切换后退出，原因是 Player 在交互导致自身被释放后才调用 `get_viewport().set_input_as_handled()`。
- 已改为在调用交互前先标记输入已处理。

### 下一步

- 在 Godot 运行窗口中手动测试：Apartment -> MainStreet -> Office，靠近 Work 工位按 `E`，完成 5 次方向输入后确认 HUD 数值变化。
- 若手动测试通过，提交本阶段改动。

### 建议提交

- `feat: add office work minigame`
