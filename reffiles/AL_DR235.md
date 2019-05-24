| Loc|Freq|OFS|ID|Call|Tone|PL|Comment |
| --- | ---- | :---: | ---| :---:| -- | ---| -------  |
|  1 | 224.4800 | - | CONI21 | N7JN | 103.5 | TSQL | Mt.Constitution Repeater |
|  2 | 222.8800 | + | REV-21 |  | 103.5 | Tone | Reverse |
|  3 | 224.4800 |   | DIR-21 |  | 103.5 | TSQL | Direct (Simplex) |
|  10 | 223.5000 |   | TAC-20 |  | 67.0 | Tone | National Simplex |
|  11 | 223.4800 |   | TAC-21 |  | 67.0 | Tone | Watcom Unified Resource Net |
|  12 | 223.5200 |   | TAC-22 |  | 67.0 | Tone |  |
|  13 | 222.4000 |   | TAC-23 |  | 67.0 | Tone |  |
|  14 | 224.0000 |   | TAC-24 |  | 67.0 | Tone |  |
|  15 | 223.4200 |   | TAC-25 |  | 103.5 | Tone | Statewide Primary |
|  16 | 223.4400 |   | TAC-26 |  | 103.5 | Tone | Statewide Alternate |
|  30 | 223.7800 |   | NET-21 |  |   |  | N7JN Vusario, RMS Gate KF7FIT-10 |
|  31 | 223.6600 |   | NET-22 |  |   |  | Airmail |
|  32 | 223.4000 |   | NET-23 |  |   |  | Airmail |
|  33 | 223.6200 |   | NET-24 |  |   |  | Airmail |
|  50 | 223.8600 | - | MED-21 | W7MBY | 103.5 | Tone | Hospital Net repeater |
|  51 | 224.1200 | - | TIGR-MT | K7LED | 103.5 | Tone | Tiger Mt. |
|  52 | 224.2400 | - | BLYN | N7NFY | 103.5 | Tone | Haystack (was Blyn) |
|  53 | 224.3000 | - | VANCUVR | VE7RPT | 127.3 |  | Vancouver, BC |
|  54 | 224.5000 | - | VICTRIA | VE7RGP | 127.3 |  | Victoria, BC |
|  55 | 224.6000 | - | BRNBY21 | VE7NYE | 127.3 | Tone | Burnaby, BC |
|  56 | 224.6600 | - | GOLD-21 | NI7IPB | 103.5 | Tone | Gold Mt. |
|  58 | 224.8600 | - | KING-21 | N7FYU | 103.5 | Tone | King Mt. |
|  59 | 224.8800 | - | MAPLRIG | VE7RMR | 103.5 |  | Maple Ridge, BC |
|  60 | 224.9200 | - | SUREY21 | VE7IFI | 103.5 |  | Coquitlem, BC |
|  61 | 224.9600 | - | BRNBY22 | VE7VYL | 103.5 |  | Burnaby, BC |
|  62 | 224.5400 | - | VUE-21 | WA6MPG | 67.0 | Tone | Vusario |
|  63 | 224.1600 | - | LOOK-21 | NC7Q | 156.7 | Tone | Hospital link to LOOK-42 |
|  64 | 224.7800 | - | LYMN-21 | N7RIG | 103.5 | Tone | Lyman Hill, link to WETNET |
|  65 | 224.5800 | - | HAYSTAK | W7WRG | 103.5 | Tone | Haystack, link to WETNET |
|  67 | 223.8800 | - | CAMNO | W7PIG | 103.5 | Tone | Camano Island |
|  68 | 224.3800 | - | SMOKY21 | VA7DEM | 103.5 | Tone | Smokey Point |
|  69 | 223.9600 | - | SUREY22 | VE7RHC | 100.0 | Tone | Surrey, BC |
|  99 | 222.000 |   | 052419 | N0NE | 88.5 |  | Revision date |

```
* CS = Carrier Squelch (no tone)
**    NBFM Repeater CHANNEL 5 output
***   NBFM Repeater channel 7 output
****  NBFM Repeater channel 8 input
```

* TAC = VOICE TAC CHANNEL
* NET = PACKET CHANNEL
* ALPHA TAGS are based on NPSTC channel naming convention as used in NIFOG:
  * FIRST NUMBER = BAND (eg 1 = 144, 2 = 220, 4 = 440) This helps eliminate confusion on dual band radios that may contain two repeaters on diferent bands with the same name/location.
  * SECOND NUMBER = CHANNEL NUMBER
    * EXAMPLE: TAC-40
    * TAC = Voice, 4 = 440 band, 0 = Nat. Simplex
* OFS heading means offset of the repeater split and when set to off inhibits transmit.
