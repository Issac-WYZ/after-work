# Art Style Guide

本文件用于定义《下班以后》0.1.5 起的美术标准。当前阶段目标是确定规范和接入方式，不是一次性替换全部正式素材。

## 视觉方向

- 类型：2D 像素风现代城市日常生活模拟。
- 题材关键词：出租屋、上班、便利店、主街区、现代生活压力、下班后的个人时间。
- 观感目标：低饱和、温暖、现代日常，不做过度卡通、夸张奇幻或强烈赛博风。
- 细节密度：0.1.5 到 0.3 保持简洁，优先保证可读性和后续扩展。

## 昼夜视觉系统

核心主题：

```text
白天是现实秩序。
夜晚是自由入口。
```

参考图仅作为 art reference / style board，不是可直接导入游戏的正式素材，不得切片作为 sprite sheet 或 tileset 使用。

| 参考 | 路径 | 用途 |
| --- | --- | --- |
| 白天视觉参考 | `docs/art_reference/after_work_day_style_board.png` | 白天角色、出租屋、办公室、便利店、街道、公园和 UI 氛围参考。 |
| 夜晚视觉参考 | `docs/art_reference/after_work_night_style_board.png` | 夜晚角色、出租屋、便利店、后街区、灯光和 UI 氛围参考。 |

### 白天视觉方向

- 关键词：冷淡都市、秩序感、通勤日常、工作压力、清醒现实。
- 主色：低饱和蓝灰、冷白、浅灰。
- 点缀色：少量暖黄、木色、浅橙或绿色，用于生活感和可交互焦点。
- 场景气质：明亮但不轻松，整洁、规训、重复、有工作节奏。
- 使用场景：出租屋白天、办公室白天、便利店白天、城市街道白天、日间 UI。

### 夜晚视觉方向

- 关键词：下班以后、疲惫后的自由、城市隐藏面、探索、机会、危险。
- 主色：深蓝、蓝灰、深紫、暗棕。
- 点缀色：暖黄灯光、便利店灯光、路灯、广告牌、霓虹小面积高亮。
- 场景气质：更低明度、更高局部对比，允许出现雨后反光、窗口灯光、暗巷和招牌。
- 使用场景：出租屋夜晚、便利店夜晚、夜晚街区、下班后探索区域、夜间 UI。

## 视角

- 推荐视角：俯视 2D / 轻微俯视。
- 角色和家具允许看到少量正面信息，但不要使用大角度等距透视。
- 碰撞区域应以玩法可读性为准，不强求完全贴合像素轮廓。

## 尺寸标准

| 类型 | 推荐尺寸 | 说明 |
| --- | --- | --- |
| Tile | 16x16 px 或 32x32 px | 0.1.5 优先选 16x16，后续如家具信息不足可切到 32x32。 |
| 主角 | 16x24 px 或 24x32 px | 推荐先用 24x32，便于表现现代服装。 |
| NPC | 16x24 px 或 24x32 px | 与主角保持同一比例，避免后续社交系统返工。 |
| 小家具 | 16x16 px / 32x16 px | 例如小桌、椅子、箱子。 |
| 中型家具 | 32x32 px / 48x32 px | 例如床、工位、货架。 |
| 大型家具 | 64x32 px / 64x48 px | 例如大沙发、双人床、收银台组合。 |
| UI 图标 | 16x16 px / 24x24 px | 状态栏优先 16x16；高清 UI 可准备 2x 导出。 |
| 交互提示 | 16x16 px 图标 + 文本 | E 键提示、门、床、工位、商品共用标准。 |

## 动画标准

- 主角基础行走：上下左右 4 个方向。
- 每方向 3 或 4 帧。
- 0.1.5 推荐先做每方向 3 帧，降低制作成本。
- 帧率建议：8 到 10 FPS。
- 默认待机可以使用行走中间帧。
- 后续 NPC 优先复用主角动画规格。

## 色彩方向

- 总体色彩：低饱和、温暖、现代日常。
- 出租屋：偏暖灰、木色、柔和灯光。
- 公司：偏冷灰、蓝灰、低对比办公色。
- 便利店：暖白灯、浅绿/浅红小面积点缀。
- 主街区：中性灰道路、低饱和建筑色、暖色窗口。
- UI：深色半透明底、浅色文字、状态图标用低饱和强调色。
- 避免：高饱和糖果色、大面积紫蓝渐变、过度卡通描边。

昼夜差异：

- 白天：降低戏剧化光影，强调冷白环境光、秩序感和现实压力。
- 夜晚：降低整体亮度，使用更强局部光源和暖色点缀，强调“下班以后”的开放感。
- 同一物件可以有 day / night 两套色彩版本，但轮廓和碰撞尺寸应尽量一致。

## 资源命名规范

统一使用小写英文、下划线分隔，不使用空格和中文文件名。

推荐格式：

```text
<category>_<subject>_<variant>_<size>.<ext>
```

示例：

```text
char_player_walk_down_24x32.png
tile_apartment_floor_16x16.png
prop_bed_single_48x32.png
ui_icon_energy_16x16.png
ui_prompt_interact_e_16x16.png
```

### 昼夜素材命名

场景素材：

```text
apartment_day_*
apartment_night_*
office_day_*
office_night_*
store_day_*
store_night_*
street_day_*
street_night_*
```

UI 素材：

```text
ui_day_*
ui_night_*
ui_icon_money
ui_icon_energy
ui_icon_mood
ui_icon_stress
ui_icon_time
ui_icon_day
```

角色素材：

```text
player_idle_down
player_walk_down
player_walk_up
player_walk_left
player_walk_right
```

导出为单文件时可追加尺寸或帧数：

```text
player_walk_down_24x32_4f.png
apartment_day_floor_16x16.png
store_night_shelf_64x32.png
ui_night_status_panel_9slice.png
```

动画帧命名：

```text
char_player_walk_down_00.png
char_player_walk_down_01.png
char_player_walk_down_02.png
```

## 目录规范

当前目录已存在：

```text
assets/placeholder/
assets/art/
assets/audio/
```

建议补充并长期保持：

```text
assets/placeholder/characters/
assets/placeholder/tiles/
assets/placeholder/props/
assets/placeholder/ui/

assets/art/characters/
assets/art/environments/
assets/art/props/
assets/art/ui/

assets/audio/sfx/
assets/audio/music/
assets/fonts/
```

说明：

- `assets/placeholder/`：占位素材，只用于验证玩法和尺寸。
- `assets/art/`：正式或准正式美术素材。
- `assets/art/ui/`：UI 图标、HUD 图形、交互提示图形。
- `assets/audio/`：音效和音乐。
- `assets/fonts/`：字体文件，优先 `.ttf` 或 `.otf`。
- 项目根目录 `ui/` 保留为 Godot UI 场景目录，不放原始美术图片。
- 占位素材和正式素材不能混放。

## 版权规范

- 第三方素材必须记录来源、作者、许可证、链接和导入日期。
- 版权不清楚的素材不得进入仓库。
- 素材许可证记录在 `docs/asset_license_log.md`。
- 音频许可证记录在 `assets/audio/licenses.md`。
- 自制素材也应在素材清单中标记来源为 `original`。

## 接入原则

- 替换素材时不改核心玩法逻辑。
- 常用素材路径应集中在场景资源、数据文件或专门资源清单中，不散落到多个脚本。
- 脚本只处理行为和状态，不直接依赖某个临时图片路径。
- 保留 placeholder 素材，直到正式素材稳定。
- 每次替换素材后必须说明测试路径和验收结果。

## 0.1.6-A 阶段边界

本阶段只做：

- 归档参考图。
- 更新美术规范。
- 更新素材清单。
- 确定昼夜视觉规则。
- 制定素材命名规范。

本阶段不做：

- 不切图。
- 不直接导入为正式素材。
- 不新增玩法。
- 不新增昼夜系统代码。
- 不替换大量现有素材。
