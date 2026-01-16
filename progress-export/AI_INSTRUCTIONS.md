# Design Specification: Progress

## Overview
- **Canvas:** 375×800px
- **Components:** 59 total
- **Interactive elements:** 10

## Component Hierarchy

🔘 **Rectangle 1** ⚡
🔘 **Rectangle 7** ⚡
📝 **Group 24**
  🔘 **Rectangle 8** ⚡
  📦 **Group 23**
    📦 **Vector 1**
    🔘 **Rectangle 9** ⚡
    🔷 **Group 22**
      📦 **Vector 2**
      📦 **Vector 3**
      📦 **Vector 4**
• **keyboard_arrow_up**
  🔷 **icon**
🔘 **Rectangle 10** ⚡
📦 **Group 9**
  📦 **Weekly Progress**
📦 **250 kcal**
🔷 **Group 53**
  📦 **Home**
  🖼️ **image 8**
📦 **Group 55**
  📦 **Summary**
  📦 **detail 101 1**
🔷 **Group 56**
  📦 **Progress**
  🖼️ **image 9**
🔷 **Group 54**
  📦 **Add**
  🖼️ **image 10**
🔘 **Group 39**
  📦 **Group 26**
    📦 **7-Day Average**
  📦 **kcal**
  📦 **250**
  🔘 **Rectangle 3** ⚡
  🖼️ **image 11**
📦 **Group 38**
  🔘 **Rectangle 12** ⚡
  📦 **Group 27**
    📦 **Calorie Intake**
  📦 **Mon**
  📦 **0**
  🔷 **40**
  🔷 **80**
  📦 **120**
  📦 **160**
  📦 **Tue**
  📦 **Wed**
  📦 **Thur**
  🔷 **Fri**
  📦 **Sat**
  📦 **Sun**
  🔘 **Rectangle 11** ⚡
  📦 **Group 37**
    📦 **On Target**
    📦 **Over Limit (>2000)**
    🔘 **Rectangle 13** ⚡
    🔘 **Rectangle 14** ⚡
  📦 **Vector 5**

## Implementation Notes

- Use flexbox for all auto-layout containers
- Interactive elements need click handlers
- Image assets are in `/images/` directory
- Text elements should render as actual text, not images

## Full Specification

See `design-spec.json` for complete element data including:
- Exact positions and dimensions
- Auto-layout properties (gap, padding, alignment)
- Constraints for responsive behavior
- Semantic role hints
- Text properties (font, size, color)
