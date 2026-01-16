# Design Specification: Sign-up Screen

## Overview
- **Canvas:** 375×800px
- **Components:** 42 total
- **Interactive elements:** 7

## Component Hierarchy

🔘 **Rectangle 1** ⚡
🔘 **Group 9**
  📦 **Start your healthy journey today.**
  🔘 **Create Account**
📦 **Full Name**
📦 **Email**
📦 **Password**
🔘 **Group 7**
  🔘 **Rectangle 3** ⚡
  📦 **SIgn-up**
📦 **Group 8**
  📦 **Already have an account? Login**
• **keyboard_arrow_up**
  🔷 **icon**
🔘 **Group 10**
  🔘 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **User**
      🔷 **Icon**
    📦 **Hussain Shah**
🔘 **Group 11**
  🔘 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **Mail**
      🔷 **Icon**
    📦 **user@example.com**
🔘 **Group 12**
  🔘 **Group 7**
    🔘 **Rectangle 3** ⚡
    📦 **Lock**
      🔷 **Icon**
    📦 **Mail**
    📦 ************
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
