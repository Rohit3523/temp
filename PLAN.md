# Edge-to-Edge Screenshot Plan

## Context

Branch `edge-to-edge` enables Android edge-to-edge rendering — UI draws behind system status/navigation bars. ~28 files changed: safe area insets on list views, ActionSheet height recalculated, emoji keyboard unified, `@zoontek/react-native-navigation-bar` replaces `expo-navigation-bar`.

---

## Bug Fixed Before Screenshots

**ActionSheet.tsx:79** — `isAndroid` was removed from imports but still referenced in `onDidPresent`. Fixed to `Platform.OS === 'android'`.

---

## Clear App Data Commands

### iOS (before first run)
```bash
xcrun simctl uninstall EB36162F-C02F-44D2-BED5-B07EB5B02436 chat.rocket.ios
pnpm ios   # reinstalls with edge-to-edge build
```

### Android (before each emulator)
```bash
adb -s <serial> shell pm clear com.rocketchat.reactnative
```

---

## Devices (7 total)

| Platform | Device | AVD / UDID |
|----------|--------|------------|
| iOS | iPhone 17 Pro | `EB36162F-C02F-44D2-BED5-B07EB5B02436` |
| Android 12 | Pixel_API_31_AOSP_Keyboard | API 31 |
| Android 13 | Pixel_6_Android_13 | API 33 |
| Android 14 | Pixel_8_Android_14 | API 34 |
| Android 15 | Pixel_6_Android_15 | API 35 |
| Android 16 | Pixel_9 | API 36 |
| Android 17 | Pixel_9_-_Android_17 | API 37 |

---

## Screens to Capture (22 per device = ~154 total)

| # | Screen | Navigation Path |
|---|--------|----------------|
| 01 | Login Screen | App cold start → "Login" |
| 02 | Register Screen | App cold start → "Create account" (don't submit) |
| 03 | Rooms List | Main screen after login |
| 04 | Select Server | Tap server name pill (top-left) |
| 05 | Room View — default | Tap any room |
| 06 | Room View — keyboard open | Tap message input field |
| 07 | Room View — emoji keyboard | Tap emoji icon in composer |
| 08 | Room View — action sheet | Long-press a message |
| 09 | Room View — compose "+" menu | Tap "+" in composer |
| 10 | Thread Messages | Tap thread indicator on a message |
| 11 | Search Messages | Room → search icon → enter query |
| 12 | Room Members | Room header → Members |
| 13 | New Message View | Pencil/compose button on rooms list |
| 14 | Directory | Directory icon in rooms list header |
| 15 | Discussions View | Room → Threads icon |
| 16 | Team Channels | Navigate to team → Channels tab |
| 17 | Status View | Own avatar → Set Status |
| 18 | Language View | Profile → Preferences → Language |
| 19 | Default Browser View | Profile → Preferences → Default Browser |
| 20 | Auto Translate View | Room → Room Info → Auto Translate |
| 21 | Read Receipt View | Long-press message → Read By |
| 22 | Messages View | Tap user avatar → Messages |

---

## Credentials

- **Workspace**: `mobile.qa.rocket.chat`
- **Email**: `mobile+edgetest@rocket.chat`
- **Username**: `edgetest`
- **Password**: `EdgeTest@123`

Register screen screenshot: navigate there but do NOT submit.

---

## Output Structure

```
~/Desktop/edge-to-edge-screenshots/
  PLAN.md               ← this file
  ios/iphone-17-pro/
    01_login.png
    02_register.png
    ...
    22_messages-view.png
  android/
    api-31-android-12/
    api-33-android-13/
    api-34-android-14/
    api-35-android-15/
    api-36-android-16/
    api-37-android-17/
```

---

## Verification Checklist

- [ ] Each folder has 22 `.png` files
- [ ] Room View keyboard-open: content not hidden behind nav bar (Android)
- [ ] Action sheet: not clipped at bottom on any Android version
- [ ] Rooms list: last item visible above nav bar
- [ ] Login/register: status bar transparent, content readable
