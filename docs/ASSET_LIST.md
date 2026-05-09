# Asset List

本文件记录《下班以后》的素材需求、状态、路径、来源和许可证。0.1.5 阶段先建立清单，不批量替换正式素材。

状态说明：

- `placeholder`：当前为占位素材或场景内几何图形。
- `draft`：已有草稿素材，可用于验证尺寸和风格。
- `final`：可长期使用的正式素材。

| 资源名称 | 类型 | 所属场景 | 推荐尺寸 | 当前状态 | 文件路径 | 来源 | 许可证 | 是否已导入 | 备注 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Day style board | art reference | Docs | reference image | draft | `docs/art_reference/after_work_day_style_board.png` | user provided reference | reference only | 否 | 仅作为白天视觉参考，不可切片或直接导入为游戏素材。 |
| Night style board | art reference | Docs | reference image | draft | `docs/art_reference/after_work_night_style_board.png` | user provided reference | reference only | 否 | 仅作为夜晚视觉参考，不可切片或直接导入为游戏素材。 |
| Player base visual reference | art reference | Docs | reference image | draft | `docs/art_reference/player_base_reference.png` | user provided reference | reference only | 否 | 仅作为主角视觉参考，不可切片或直接接入 AnimatedSprite2D。 |
| Player base walk | character animation | Shared / Player | 16x32 px, 4 directions, idle 1 frame + walk 4 frames | draft | `assets/art/characters/player_base_16x32.png` | generated draft based on user reference | project draft | 是 | 严格 80x128，5 列 x 4 行；已通过 SpriteFrames 接入 Player.tscn，并通过 Godot 4.6.2 headless 场景加载验收；仍为 draft。 |
| Apartment floor tiles | tileset | Apartment | 16x16 px | placeholder | `scenes/apartment/Apartment.tscn` | original placeholder | N/A | 是 | 当前为 Polygon2D floor。 |
| Apartment wall tiles | tileset | Apartment | 16x16 px | placeholder | `scenes/apartment/Apartment.tscn` | original placeholder | N/A | 是 | 当前为碰撞墙和简单边界。 |
| Bed single | prop / interactable | Apartment | 48x32 px or 64x32 px | placeholder | `scenes/apartment/Apartment.tscn` | original placeholder | N/A | 是 | 当前为 Polygon2D，已接睡觉交互。 |
| Main street road tiles | tileset | MainStreet | 16x16 px | placeholder | `scenes/main_street/MainStreet.tscn` | original placeholder | N/A | 是 | 当前为 Polygon2D road。 |
| Main street building fronts | environment | MainStreet | 64x48 px per facade | placeholder | `scenes/main_street/MainStreet.tscn` | original placeholder | N/A | 是 | Apartment / Office / Store 三个入口建筑。 |
| Office floor tiles | tileset | Office | 16x16 px | placeholder | `scenes/office/Office.tscn` | original placeholder | N/A | 是 | 当前为 Polygon2D floor。 |
| Office workstation | prop / interactable | Office | 48x32 px or 64x32 px | placeholder | `scenes/office/Office.tscn` | original placeholder | N/A | 是 | 已接工作小游戏。 |
| Convenience store floor tiles | tileset | ConvenienceStore | 16x16 px | placeholder | `scenes/convenience_store/ConvenienceStore.tscn` | original placeholder | N/A | 是 | 当前为 Polygon2D floor。 |
| Convenience store shelf | prop | ConvenienceStore | 64x32 px | placeholder | `scenes/convenience_store/ConvenienceStore.tscn` | original placeholder | N/A | 是 | 商品交互点放在货架前。 |
| Bento item | prop / interactable | ConvenienceStore | 16x16 px or 24x24 px | placeholder | `scenes/convenience_store/ConvenienceStore.tscn` | original placeholder | N/A | 是 | 已接购买逻辑。 |
| Coffee item | prop / interactable | ConvenienceStore | 16x16 px or 24x24 px | placeholder | `scenes/convenience_store/ConvenienceStore.tscn` | original placeholder | N/A | 是 | 已接购买逻辑。 |
| Dessert item | prop / interactable | ConvenienceStore | 16x16 px or 24x24 px | placeholder | `scenes/convenience_store/ConvenienceStore.tscn` | original placeholder | N/A | 是 | 已接购买逻辑。 |
| Scene transition marker | interactable prompt | Shared | 32x32 px | placeholder | `scenes/shared/SceneTransition.tscn` | original placeholder | N/A | 是 | 门口/地点切换交互。 |
| Interaction prompt | UI | Shared | 16x16 px icon + text | placeholder | `scenes/shared/SceneTransition.tscn` | original placeholder | N/A | 是 | 后续统一替换为提示框或按键图标。 |
| Status HUD panel | UI | HUD | scalable panel, icons 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 是 | 当前为 Godot Control + StyleBox。 |
| Day icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Time icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Money icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Energy icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Mood icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Stress icon | UI icon | HUD | 16x16 px | placeholder | `ui/hud/StatusHUD.tscn` | original placeholder | N/A | 否 | 当前只有文字。 |
| Work minigame prompt panel | UI | WorkMiniGame | scalable panel, prompt text 48 px | placeholder | `ui/minigames/WorkMiniGame.tscn` | original placeholder | N/A | 是 | 当前仅用于 0.1 占位玩法。 |
| UI font | font | Global UI | readable at 12-16 px | placeholder | TBD: `assets/fonts/` | TBD | TBD | 否 | 0.1.5 需选择可商用字体或自制字体。 |

## 0.1.5 素材优先级

1. 主角基础行走动画。
2. 出租屋基础 tileset。
3. UI 状态栏与图标。
4. 交互提示框。
5. 公司和便利店的核心物件。

## 0.1.6-A 昼夜素材计划

### P0

| 资源名称 | 类型 | 所属场景 | 推荐尺寸 | 当前状态 | 文件路径 | 来源 | 许可证 | 是否已导入 | 备注 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Player base sprite sheet | character animation | Shared / Player | 16x32 px, 4 directions, idle 1 frame + walk 4 frames | draft | `assets/art/characters/player_base_16x32.png` | generated draft based on user reference | project draft | 是 | Row 0 down, Row 1 up, Row 2 left, Row 3 right；每行 idle + walk 4 帧；已接入 AnimatedSprite2D 和 `player_base_16x32_frames.tres`，通过 0.1.6-B headless 加载验收。 |
| UI status icons | UI icon set | HUD | 16x16 px or 24x24 px | placeholder | TBD: `assets/art/ui/ui_icon_*.png` | TBD | TBD | 否 | 包括 money、energy、mood、stress、time、day。 |
| Apartment day tileset | tileset | Apartment | 16x16 px | placeholder | TBD: `assets/art/environments/apartment_day_tileset.png` | TBD | TBD | 否 | 白天现实秩序版本，低饱和冷白和浅灰为基础，少量暖色生活点缀。 |
| Apartment night tileset | tileset | Apartment | 16x16 px | placeholder | TBD: `assets/art/environments/apartment_night_tileset.png` | TBD | TBD | 否 | 夜晚自由入口版本，深蓝/蓝灰环境，暖黄室内灯光。 |

### P1

| 资源名称 | 类型 | 所属场景 | 推荐尺寸 | 当前状态 | 文件路径 | 来源 | 许可证 | 是否已导入 | 备注 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Office day tileset | tileset | Office | 16x16 px | placeholder | TBD: `assets/art/environments/office_day_tileset.png` | TBD | TBD | 否 | 强调冷淡都市、秩序感、工作压力。 |
| Convenience store day tileset | tileset | ConvenienceStore | 16x16 px | placeholder | TBD: `assets/art/environments/store_day_tileset.png` | TBD | TBD | 否 | 明亮冷白灯光，便利店商品可读性优先。 |
| Convenience store night tileset | tileset | ConvenienceStore | 16x16 px | placeholder | TBD: `assets/art/environments/store_night_tileset.png` | TBD | TBD | 否 | 便利店灯光作为夜晚暖色安全点。 |
| City street day reference tileset | tileset | MainStreet | 16x16 px | placeholder | TBD: `assets/art/environments/street_day_tileset.png` | TBD | TBD | 否 | 白天通勤、公交、道路和店面秩序感参考。 |
| Night street reference tileset | tileset | MainStreet | 16x16 px | placeholder | TBD: `assets/art/environments/street_night_tileset.png` | TBD | TBD | 否 | 夜晚街区、路灯、广告牌、雨后反光和探索氛围参考。 |

## 0.1.6-A 阶段边界

本阶段只做：

- 归档昼夜参考图。
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

## 0.1.6-B 主角 sprite sheet 接入验收

- `assets/art/characters/player_base_16x32.png` 保持 draft 状态，当前仅用于验证主角动画管线和尺寸。
- `scenes/shared/Player.tscn` 已使用 `AnimatedSprite2D` 引用 `assets/art/characters/player_base_16x32_frames.tres`。
- `player_base_16x32_frames.tres` 已按 16x32 单帧切分，包含 4 个 idle 动画和 4 个 walk 动画。
- 已通过 Godot 4.6.2 headless 加载 Player、Apartment、MainStreet、Office、ConvenienceStore 场景。
- 已手动目视验收上下左右移动动画、停止后的 idle 朝向，以及门、床、工位、商品交互。

## 记录要求

- 新素材进入仓库前，必须补齐来源和许可证。
- 替换素材后，必须更新 `文件路径`、`当前状态`、`是否已导入` 和 `备注`。
- 草稿素材使用 `draft`，不要直接标记为 `final`。
