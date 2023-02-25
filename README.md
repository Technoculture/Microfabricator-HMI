# MicroFAB HMI

> [UI-Concepts](https://microfabricator-hmi.vercel.app)

## ASCII based Protocol

| Message | Content |
| --- | --- |
| 'O' | Open Slider |
| 'C' | Close Slider |
| 'D' | Done Slider Open/Close |
| 'T' | Timeout Slider Open./Close |
| 'E' | Failed to Open/Close Slider |
| 'G\<gap\>' | Mask Wafer Gap. Example `G28` is 28um Mask Wafer Gap. Max gap 1000um |
| 'G' | Start Mask Wafer Gap Stream |
| 'S' | Stop Mask Wafer Gap Stream |

### Sequence Diagram
[![](https://mermaid.ink/img/pako:eNqFkU1vgzAMhv9KlBPVinaPpl4AcepaDVU7AAeLuDQqJMyEfajqf19oYOtUVfMpsR_H7xufeGUkcsF7fBtQVxgrqAnaQjMX0XYXrlYP62gn2KZDHWwW7JFFjekxiBYsa5RE8qhjRjQm9Y4kWGqsCT4XvuaTrhxeXnpBqA4or_tCN0mw2GgM4nFEQmQoT0rP3IrJLJBla-iP7BX2SC5BCG2eln_UJHp0RzPvIaVrNhXY1vTKKqN9V2NMxzrTNP46xgSGP-Kf8eNO9zzXoRc3V-pS6PL0qYZuNelDLX9NuYbJlBt_6ykr__2pIJl-mi95i9SCkm6lpzFXcHvAFgsu3FECHQte6LPjYLAm-9IVF5YGXPKhk2Dn9XOxh6bH8zeji6VJ?type=png)](https://mermaid.live/edit#pako:eNqFkU1vgzAMhv9KlBPVinaPpl4AcepaDVU7AAeLuDQqJMyEfajqf19oYOtUVfMpsR_H7xufeGUkcsF7fBtQVxgrqAnaQjMX0XYXrlYP62gn2KZDHWwW7JFFjekxiBYsa5RE8qhjRjQm9Y4kWGqsCT4XvuaTrhxeXnpBqA4or_tCN0mw2GgM4nFEQmQoT0rP3IrJLJBla-iP7BX2SC5BCG2eln_UJHp0RzPvIaVrNhXY1vTKKqN9V2NMxzrTNP46xgSGP-Kf8eNO9zzXoRc3V-pS6PL0qYZuNelDLX9NuYbJlBt_6ykr__2pIJl-mi95i9SCkm6lpzFXcHvAFgsu3FECHQte6LPjYLAm-9IVF5YGXPKhk2Dn9XOxh6bH8zeji6VJ)
