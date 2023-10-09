00000000 <main>:
    0:        10000517        auipc x10 0x10000
    4:        00050513        addi x10 x10 0
    8:        00400593        addi x11 x0 4
    c:        00000613        addi x12 x0 0
    10:        034000ef        jal x1 52 <bit_plane_slicing>
    14:        10000517        auipc x10 0x10000
    18:        ffc50513        addi x10 x10 -4
    1c:        00900593        addi x11 x0 9
    20:        00100613        addi x12 x0 1
    24:        020000ef        jal x1 32 <bit_plane_slicing>
    28:        10000517        auipc x10 0x10000
    2c:        00c50513        addi x10 x10 12
    30:        00600593        addi x11 x0 6
    34:        00200613        addi x12 x0 2
    38:        00c000ef        jal x1 12 <bit_plane_slicing>
    3c:        00a00893        addi x17 x0 10
    40:        00000073        ecall

00000044 <bit_plane_slicing>:
    44:        fff00413        addi x8 x0 -1
    48:        000004b3        add x9 x0 x0

0000004c <clzLoop>:
    4c:        00249393        slli x7 x9 2
    50:        00a383b3        add x7 x7 x10
    54:        0003aa03        lw x20 0 x7
    58:        ff810113        addi x2 x2 -8
    5c:        00112023        sw x1 0 x2
    60:        00a12223        sw x10 4 x2
    64:        01400533        add x10 x0 x20
    68:        098000ef        jal x1 152 <count_leading_zeros>
    6c:        00012083        lw x1 0 x2
    70:        00412503        lw x10 4 x2
    74:        00810113        addi x2 x2 8
    78:        00d00933        add x18 x0 x13
    7c:        01f00313        addi x6 x0 31
    80:        412309b3        sub x19 x6 x18
    84:        0133a023        sw x19 0 x7
    88:        0689d463        bge x19 x8 104 <isGreater>

0000008c <goOn>:
    8c:        00148493        addi x9 x9 1
    90:        fab4cee3        blt x9 x11 -68 <clzLoop>
    94:        ff810113        addi x2 x2 -8
    98:        00112023        sw x1 0 x2
    9c:        00a12223        sw x10 4 x2
    a0:        0ec000ef        jal x1 236 <printLoopOutside>
    a4:        00012083        lw x1 0 x2
    a8:        00412503        lw x10 4 x2
    ac:        00810113        addi x2 x2 8
    b0:        000004b3        add x9 x0 x0

000000b4 <reconLoop>:
    b4:        00249393        slli x7 x9 2
    b8:        00a383b3        add x7 x7 x10
    bc:        0003aa03        lw x20 0 x7
    c0:        028a0c63        beq x20 x8 56 <isEqual>
    c4:        00000a33        add x20 x0 x0

000000c8 <goOn2>:
    c8:        ff810113        addi x2 x2 -8
    cc:        00112023        sw x1 0 x2
    d0:        00a12223        sw x10 4 x2
    d4:        0f8000ef        jal x1 248 <printLoopInside>
    d8:        00012083        lw x1 0 x2
    dc:        00412503        lw x10 4 x2
    e0:        00810113        addi x2 x2 8
    e4:        00148493        addi x9 x9 1
    e8:        fcb4c6e3        blt x9 x11 -52 <reconLoop>
    ec:        00008067        jalr x0 x1 0

000000f0 <isGreater>:
    f0:        01300433        add x8 x0 x19
    f4:        f99ff06f        jal x0 -104 <goOn>

000000f8 <isEqual>:
    f8:        0ff00a13        addi x20 x0 255
    fc:        fcdff06f        jal x0 -52 <goOn2>

00000100 <count_leading_zeros>:
    100:        00155293        srli x5 x10 1
    104:        00556533        or x10 x10 x5
    108:        00255293        srli x5 x10 2
    10c:        00556533        or x10 x10 x5
    110:        00455293        srli x5 x10 4
    114:        00556533        or x10 x10 x5
    118:        00855293        srli x5 x10 8
    11c:        00556533        or x10 x10 x5
    120:        01055293        srli x5 x10 16
    124:        00556533        or x10 x10 x5

00000128 <count_ones>:
    128:        00155293        srli x5 x10 1
    12c:        55555337        lui x6 0x55555
    130:        55536313        ori x6 x6 1365
    134:        0062f2b3        and x5 x5 x6
    138:        40550533        sub x10 x10 x5
    13c:        00255293        srli x5 x10 2
    140:        33333337        lui x6 0x33333
    144:        33336313        ori x6 x6 819
    148:        0062f2b3        and x5 x5 x6
    14c:        00657eb3        and x29 x10 x6
    150:        01d28533        add x10 x5 x29
    154:        00455293        srli x5 x10 4
    158:        00a282b3        add x5 x5 x10
    15c:        0f0f0337        lui x6 0xf0f0
    160:        78736313        ori x6 x6 1927
    164:        78830313        addi x6 x6 1928
    168:        0062f533        and x10 x5 x6
    16c:        00855293        srli x5 x10 8
    170:        00550533        add x10 x10 x5
    174:        01055293        srli x5 x10 16
    178:        00550533        add x10 x10 x5
    17c:        07f57293        andi x5 x10 127
    180:        02000313        addi x6 x0 32
    184:        405306b3        sub x13 x6 x5
    188:        00008067        jalr x0 x1 0

0000018c <printLoopOutside>:
    18c:        10000517        auipc x10 0x10000
    190:        ec950513        addi x10 x10 -311
    194:        00400893        addi x17 x0 4
    198:        00000073        ecall
    19c:        10000517        auipc x10 0x10000
    1a0:        eb050513        addi x10 x10 -336
    1a4:        00400893        addi x17 x0 4
    1a8:        00000073        ecall
    1ac:        00c00533        add x10 x0 x12
    1b0:        00100893        addi x17 x0 1
    1b4:        00000073        ecall
    1b8:        10000517        auipc x10 0x10000
    1bc:        e9a50513        addi x10 x10 -358
    1c0:        00400893        addi x17 x0 4
    1c4:        00000073        ecall
    1c8:        00008067        jalr x0 x1 0

000001cc <printLoopInside>:
    1cc:        01400533        add x10 x0 x20
    1d0:        00100893        addi x17 x0 1
    1d4:        00000073        ecall
    1d8:        10000517        auipc x10 0x10000
    1dc:        e7f50513        addi x10 x10 -385
    1e0:        00400893        addi x17 x0 4
    1e4:        00000073        ecall
    1e8:        00008067        jalr x0 x1 0
