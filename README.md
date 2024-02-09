# MicroFAB HMI

> [UI-Concepts](https://microfabricator-hmi.vercel.app)

## ASCII based Protocol

| Message | Content | Hex |
| --- | --- | --- |
| 'O' | Open Slider | 0x4F |
| 'C' | Close Slider | 0x43 |
| 'D' | Done Slider Open/Close | 0x44 |
| 'T' | Timeout Slider Open./Close | 0x54 |
| 'E' | Failed to Open/Close Slider | 0x45 |
| 'G\<gap\>' | Mask Wafer Gap. Example `G28` is 28um Mask Wafer Gap. Max gap 1000um | 0x47 |
| 'G' | Start Mask Wafer Gap Stream | 0x47 |
| 'S' | Stop Mask Wafer Gap Stream | 0x53 |
| 'V' | Start Vibration value stream | 0x56 |
| 'v' | Stop Vibration value stream | 0x76 |
| 'X' | Vibration value stream started/stopped | 0x58 |
| 'V\<vibration\>' | Vibration value | 0x56 |
| 'L'| Start LDR value stream | 0x4C |
| 'l' | Stop LDR value stream | 0x6C |
| 'Y' | LDR value started/stopped | 0x59 |
| 'L\<value\>' | Current LDR value | 0x4C |

### Sequence Diagram
[![](https://mermaid.ink/img/pako:eNqFkU1vgzAMhv9KlBPVinaPpl4AcepaDVU7AAeLuDQqJMyEfajqf19oYOtUVfMpsR_H7xufeGUkcsF7fBtQVxgrqAnaQjMX0XYXrlYP62gn2KZDHWwW7JFFjekxiBYsa5RE8qhjRjQm9Y4kWGqsCT4XvuaTrhxeXnpBqA4or_tCN0mw2GgM4nFEQmQoT0rP3IrJLJBla-iP7BX2SC5BCG2eln_UJHp0RzPvIaVrNhXY1vTKKqN9V2NMxzrTNP46xgSGP-Kf8eNO9zzXoRc3V-pS6PL0qYZuNelDLX9NuYbJlBt_6ykr__2pIJl-mi95i9SCkm6lpzFXcHvAFgsu3FECHQte6LPjYLAm-9IVF5YGXPKhk2Dn9XOxh6bH8zeji6VJ?type=png)](https://mermaid.live/edit#pako:eNqFkU1vgzAMhv9KlBPVinaPpl4AcepaDVU7AAeLuDQqJMyEfajqf19oYOtUVfMpsR_H7xufeGUkcsF7fBtQVxgrqAnaQjMX0XYXrlYP62gn2KZDHWwW7JFFjekxiBYsa5RE8qhjRjQm9Y4kWGqsCT4XvuaTrhxeXnpBqA4or_tCN0mw2GgM4nFEQmQoT0rP3IrJLJBla-iP7BX2SC5BCG2eln_UJHp0RzPvIaVrNhXY1vTKKqN9V2NMxzrTNP46xgSGP-Kf8eNO9zzXoRc3V-pS6PL0qYZuNelDLX9NuYbJlBt_6ykr__2pIJl-mi95i9SCkm6lpzFXcHvAFgsu3FECHQte6LPjYLAm-9IVF5YGXPKhk2Dn9XOxh6bH8zeji6VJ)
