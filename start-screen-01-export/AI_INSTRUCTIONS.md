# Design Specification: Start Screen 01

## Overview
- **Canvas:** 375×800px
- **Components:** 18 total
- **Interactive elements:** 2

## Component Hierarchy

🔘 **Rectangle 1** ⚡
📦 **Group 2**
  📦 **Group 5**
    📦 **Vector**
    🔷 **Vector**
    🔷 **Vector**
  📦 **Group 6**
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
🔘 **Rectangle 2** ⚡

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
