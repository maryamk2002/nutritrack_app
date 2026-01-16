# Design Specification: Dashboard

## Overview
- **Canvas:** 375×800px
- **Components:** 81 total
- **Interactive elements:** 12

## Component Hierarchy

🔘 **Rectangle 1** ⚡
🔘 **Group 9**
  📦 **Hello, hussain**
  📦 **Thursday, December 18**
🔘 **Group 14**
  🔘 **Rectangle 3** ⚡
  🔘 **Group 15**
    📦 **Add Meal**
    📦 **+**
📦 **Group 17**
  🔘 **Rectangle 3** ⚡
  🔷 **Ellipse 1**
  📦 **Breakfast**
  📦 **Log your breakfast**
  📦 **+**
  🔷 **croissant 1**
📦 **Group 18**
  🔘 **Rectangle 3** ⚡
  🔷 **Ellipse 1**
  📦 **Lunch**
  📦 **Log your lunch**
  📦 **+**
  🔷 **croissant 1**
📦 **Group 19**
  🔘 **Rectangle 3** ⚡
  🔷 **Ellipse 1**
  📦 **Dinner**
  📦 **Log your dinner**
  📦 **+**
  🔷 **croissant 1**
📦 **Group 20**
  🔘 **Rectangle 3** ⚡
  🔷 **Ellipse 1**
  📦 **Snack**
  📦 **Log your snack**
  📦 **+**
  🔷 **croissant 1**
🔘 **Group 15**
  🔘 **Rectangle 3** ⚡
📦 **Group 13**
  🔘 **Rectangle 5** ⚡
  🔘 **Rectangle 6** ⚡
  📦 **Calories Consumed**
  📦 **Daily Goal**
  📦 **/2000**
  🔘 **250**
📦 **Group 16**
  📦 **Group 15**
    📦 **Details**
  • **keyboard_arrow_up**
    🔷 **icon**
📦 **Meals**
🔘 **Rectangle 7** ⚡
🔷 **Group 21**
  🔷 **Ellipse 2**
  🖼️ **image 5**
🔷 **Group 42**
  📦 **Home**
  🖼️ **image 8**
📦 **Group 43**
  📦 **Summary**
  📦 **detail 101 1**
🔷 **Group 44**
  📦 **Progress**
  🖼️ **image 9**
🔷 **Group 41**
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
🔷 **Group 40**
  🔷 **Ellipse 2**
  📦 **User**
    🔷 **Icon**

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
