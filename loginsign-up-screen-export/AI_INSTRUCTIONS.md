# Design Specification: Login/sign-up Screen

## Overview
- **Canvas:** 375×800px
- **Components:** 37 total
- **Interactive elements:** 5

## Component Hierarchy

🔘 **Rectangle 1** ⚡
📦 **Group 2**
  📦 **Group 5**
    📦 **Vector**
    📦 **Vector**
    🔷 **Vector**
  🔘 **Group 6**
    🔷 **Vector**
    🔷 **Vector**
    📦 **Vector**
    📦 **Vector**
    📦 **Vector**
    🔷 **Vector**
    📦 **Vector**
    🔷 **Vector**
    🔷 **Vector**
    📦 **Vector**
🔘 **Group 9**
  📦 **Eat Healthy**
  📦 **Track Your Meals.**
🔘 **Group 10**
  🔘 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **Login**
🔘 **Group 11**
  🔘 **Group 8**
    🔘 **Rectangle 4** ⚡
    📦 **Sign-up**
📝 **Group 24**
  🔘 **Rectangle 8** ⚡
  📦 **Group 23**
    📦 **Vector 1**
    🔘 **Rectangle 9** ⚡
    🔷 **Group 22**
      📦 **Vector 2**
      📦 **Vector 3**
      📦 **Vector 4**

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
