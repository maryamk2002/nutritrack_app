# Design Specification: Add Meal

## Overview
- **Canvas:** 375×800px
- **Components:** 62 total
- **Interactive elements:** 11

## Component Hierarchy

🔘 **Rectangle 1** ⚡
📦 **Group 34**
  • **Group 27**
    🔘 **Rectangle 3** ⚡
    🔘 **Group 26**
      📦 **Breakfast**
      🔷 **croissant 1**
  • **Group 28**
    🔘 **Rectangle 3** ⚡
    🔘 **Group 26**
      📦 **Lunch**
      🔷 **croissant 1**
  • **Group 31**
    🔘 **Rectangle 3** ⚡
    🔘 **Group 26**
      📦 **Snack**
      🔷 **croissant 1**
  • **Group 32**
    🔘 **Rectangle 3** ⚡
    🔘 **Group 26**
      📦 **Dinner**
      🔷 **croissant 1**
🔘 **Rectangle 7** ⚡
🔷 **Group 45**
  📦 **Home**
  🖼️ **image 8**
📦 **Group 47**
  📦 **Summary**
  📦 **detail 101 1**
🔷 **Group 48**
  📦 **Progress**
  🖼️ **image 9**
🔷 **Group 46**
  📦 **Add**
  🖼️ **image 6**
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
📦 **Group 9**
  📦 **Add Meal**
📦 **Food Name**
📦 **Calories**
📝 **Group 10**
  📝 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **e.g.. Avocado Toast**
📝 **Group 33**
  📝 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **0**
    📦 **Kcal**
📝 **Group 7**
  🔘 **Rectangle 3** ⚡
  📦 **Save Meal**

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
