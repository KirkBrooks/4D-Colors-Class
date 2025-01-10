# 4D-Colors-Class

[![4D Version](https://img.shields.io/badge/4D-v20+-blue.svg)](https://developer.4d.com/)
[![platform](https://img.shields.io/static/v1?label=platform&message=macOS%20|%20windows&color=blue)](https://doc.4d.com/)
[![license](https://img.shields.io/github/license/KirkBrooks/4D-Colors-Class)](LICENSE)

# Colors Class Documentation

## Overview
The Colors class provides utility functions for handling color values across different formats including integers, hexadecimal, and RGB arrays. This class simplifies color format conversions commonly used in 4D applications.

The class is well suited to be a singleton.

## Class Methods

### rgbToInteger ($r : Variant; $g : Integer; $b : Integer) : Integer
Converts RGB values to a 32-bit integer representation.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $r | Variant | Either red component (0-255) <br>or collection of [r,g,b] values |
| $g | Integer | Green component (0-255) |
| $b | Integer | Blue component (0-255) |

**Returns:**
| Type | Description |
|------|-------------|
| Integer | Color value in format 0x00RRGGBB |

**Example:**
```4d
$color:=Colors.rgbToInteger(205; 192; 80)  // Returns 13484112
$color:=Colors.rgbToInteger([205; 192; 80])  // Same result
```

### integerToRgb ($int : Integer) : Collection
Converts a 32-bit integer color value to RGB components.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $int | Integer | Color value in 0x00RRGGBB format |

**Returns:**
| Type | Description |
|------|-------------|
| Collection | Array of [red, green, blue] values (0-255) |

**Example:**
```4d
$rgb:=Colors.integerToRgb(13484112)  // Returns [205, 192, 80]
```

### rgbToHex ($r : Variant; $g : Integer; $b : Integer) : Text
Converts RGB values to hexadecimal color representation.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $r | Variant | Red component (0-255) <br>or collection of [r,g,b] <br>or integer color value |
| $g | Integer | Green component (0-255), optional |
| $b | Integer | Blue component (0-255), optional |

**Returns:**
| Type | Description |
|------|-------------|
| Text | Color in "#RRGGBB" format |

**Example:**
```4d
$hex:=Colors.rgbToHex(205; 192; 80)  // Returns "#CDC050"
$hex:=Colors.rgbToHex([205; 192; 80])  // Returns "#CDC050"
$hex:=Colors.rgbToHex(13484112)  // Returns "#CDC050"
```

### hexToInteger ($hex : Text) : Integer
Converts a hexadecimal color string to its integer representation.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $hex | Text | Color in "#RRGGBB", "0xRRGGBB", "0x00RRGGBB", or "RRGGBB" format |

**Returns:**
| Type | Description |
|------|-------------|
| Integer | Color value in 0x00RRGGBB format |

**Example:**
```4d
$int:=Colors.hexToInteger("#CDC050")  // Returns 13484112
$int:=Colors.hexToInteger("0x00CDC050")  // Returns 13484112
```

### integerToHex ($int : Integer) : Text
Converts an integer color value to hexadecimal format.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $int | Integer | Color value in 0x00RRGGBB format |

**Returns:**
| Type | Description |
|------|-------------|
| Text | Color in "0x00RRGGBB" format |

**Example:**
```4d
$hex:=Colors.integerToHex(13484112)  // Returns "0x00CDC050"
```

### integerToColor ($int : Integer) : Text
Converts an integer color value to web color format.

**Parameters:**
| Parameter | Data Type | Description |
|-----------|-----------|-------------|
| $int | Integer | Color value in 0x00RRGGBB format |

**Returns:**
| Type | Description |
|------|-------------|
| Text | Color in "#RRGGBB" format |

**Example:**
```4d
$color:=Colors.integerToColor(13484112)  // Returns "#CDC050"
```

## Private Methods

### _test
Internal test function that validates all color conversion operations and illustrates function usage.

## Notes
- All color components are expected to be in the range 0-255
- Integer color values use the format 0x00RRGGBB where:
  - RR = Red component (00-FF)
  - GG = Green component (00-FF)
  - BB = Blue component (00-FF)
- The class includes comprehensive error handling for various input formats
- Built-in test function provides validation of all conversion methods
