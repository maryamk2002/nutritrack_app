# Design Specification: Summary

## Overview
- **Canvas:** 375×800px
- **Components:** 40 total
- **Interactive elements:** 6

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
  📦 **Daily Summary**
📦 **250 kcal**
📦 **Group 35**
  📦 **Group 17**
    🔘 **Rectangle 3** ⚡
    📦 **Breakfast**
    📦 **Biryani**
    📦 **150**
    📦 **kcal**
    📦 **12:32 AM**
    📦 **Clock**
      🔷 **Icon**
  🖼️ **image 10**
🔷 **Group 49**
  📦 **Home**
  🖼️ **image 8**
📦 **Group 51**
  📦 **Summary**
  📦 **detail 101 1**
🔷 **Group 52**
  📦 **Progress**
  🖼️ **image 9**
🔷 **Group 50**
  📦 **Add**
  🖼️ **image 10**

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
