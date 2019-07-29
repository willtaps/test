*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
    PROGRAM LOOK.UP.X

    YID = TRIM(@SENTENCE[" ",2,1])
    OPEN "","F.SIBS.MESSAGE.TAG.SB" TO F.SIBS THEN
        READ YREC FROM F.SIBS,YID THEN
            Y1 = YREC<1>
            CMD = "LIST F.IB.MESSAGE.TAG.SB WITH SYMBOL EQ '": Y1 : "' SYMBOL"
            EXEC CMD
        END
    END
    STOP

END
