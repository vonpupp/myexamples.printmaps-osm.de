--[[
Lua script for generating grid labels

autor   : printmaps-osm.de
version : 2018/12/02

#   - min (tab 1): 36.662837400° N, -4.45919095223° W
#     - UTM: 30 N 369592 4058463
#     - Military: 30S UF 69591 58462
#   - max (tab 2): 36.7571336705° N, -4.29280904777° W
#     - UTM: 30 N 384603 4068710
#     - Military: 30S UF 84603 68710
# - With those values, I constructed the appropriate utmgrid command:
#   ./printmaps utmgrid "30 N 369592 4058463" "30 N 384603 4068710" 1000
]]

numberOfGridLines = 13
labelTextIncrement = 0.01
labelPositionIncrement = 19.68
labelText = -4.45
labelPosition = 27.15

print()
print(string.format("# lon grid values (increment %.2f)", labelPositionIncrement))
print("# ---------------------------------")
print()
for index = 1, numberOfGridLines, 1 do
    print(string.format("- Style: <TextSymbolizer fontset-name='fontset-0' size='12' fill='dimgray' allow-overlap='true'>'%.2f°'</TextSymbolizer>", labelText))
    print(string.format("  WellKnownText: POINT(%.2f 15.5)", labelPosition))
--    print(string.format("- Style: <TextSymbolizer fontset-name='fontset-0' size='18' fill='dimgray' allow-overlap='true'>'%02d'</TextSymbolizer>", labelText))
--    print(string.format("  WellKnownText: POINT(%.2f 825.5)", labelPosition))
    print()
    labelText = labelText + labelTextIncrement
    if labelText > 99 then
        labelText = 0
    end
    labelPosition = labelPosition + labelPositionIncrement
end

numberOfGridLines = 9
labelTextIncrement = 0.01
labelPositionIncrement = 19.68
labelText = 36.66
labelPosition = 27.15

print(string.format("# lat grid values (increment %.2f)", labelPositionIncrement))
print("# ---------------------------------")
print()
for index = 1, numberOfGridLines, 1 do
    print(string.format("- Style: <TextSymbolizer fontset-name='fontset-0' size='12' fill='dimgray' allow-overlap='true'>'%.2f°'</TextSymbolizer>", labelText))
    print(string.format("  WellKnownText: POINT(15.0 %.2f)", labelPosition))
--    print(string.format("- Style: <TextSymbolizer fontset-name='fontset-0' size='18' fill='dimgray' allow-overlap='true'>'%02d'</TextSymbolizer>", labelText))
--    print(string.format("  WellKnownText: POINT(825.5 %.2f)", labelPosition))
    print()
    labelText = labelText + labelTextIncrement
    if labelText > 99 then
        labelText = 0
    end
    labelPosition = labelPosition + labelPositionIncrement
end
