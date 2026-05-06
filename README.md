# 下班以后

《下班以后》是一款 2D 像素风现代生活模拟游戏。玩家从普通城市打工人的日常开始，在出租屋、公司、便利店等基础地点中完成每日循环，后续逐步扩展为更自由的现代城市生活模拟。

## 技术栈

- Engine: Godot 4.6.x stable
- Language: GDScript
- Target Platforms: macOS, Windows
- Art Direction: 2D pixel art
- Current Asset Rule: placeholder-only for 0.1

## 当前版本目标

0.1 版本只做最小可玩日常闭环：

```text
起床 -> 出租屋 -> 去公司 -> 工作小游戏 -> 获得工资 -> 去便利店买东西 -> 回家睡觉 -> 第二天
```

0.1 不做开放世界、大地图、NPC、剧情、存档、装修、技能系统、多职业、复杂美术或复杂音效。

## 如何运行项目

当前阶段只包含项目文档和目录结构，尚未初始化 Godot 功能工程。

后续 Godot 项目初始化完成后，运行方式应为：

1. 安装 Godot 4.6.x stable。
2. 克隆本仓库。
3. 使用 Godot 打开项目根目录。
4. 运行配置好的主场景。

## 跨平台原则

- 项目资源路径使用 `res://`。
- 用户数据、存档、配置和缓存使用 `user://`。
- 不写死 macOS 或 Windows 专属路径。
- 输入必须通过 Godot InputMap 配置。
- UI 需要适配不同屏幕比例和窗口尺寸。
- 重要版本需要进行 macOS 和 Windows 导出测试。
