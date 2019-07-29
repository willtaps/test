*-----------------------------------------------------------------------------
* <Rating>750</Rating>
*-----------------------------------------------------------------------------
    PROGRAM UPDATE.LINK.X

    OPEN "","F.IB.MESSAGE.TAG.SB" TO F.IB ELSE NULL
    OPEN "","F.SIBS.MESSAGE.TAG.SB" TO F.SIBS ELSE NULL
    OPEN "","F.IB.MESSAGE.TAG.SB$NAU" TO F.IB.NAU ELSE NULL

    YMAP = ""  ; YMAPPED = ""
    CMD = "SELECT F.IB.MESSAGE.TAG.SB"
    EXEC CMD
    LOOP
        READNEXT YID ELSE YID = ""
    WHILE YID DO
        READ R.TEMP FROM F.IB, YID THEN
            Y1 = R.TEMP<1>
            YDUP = 0
            IF Y1 THEN
                LOCATE Y1 IN YMAP<1,1> SETTING POS THEN
                    CRT "DUPLICATE SYMBOL " : Y1 : " " : YMAP<2,POS> : " ---> " : YID
                    YDUP = 1
                END
                IF NOT(YDUP) THEN
                    YMAP<1,POS> = Y1
                    YMAP<2,POS> = YID
                END
            END
        END
    REPEAT

    CLEARSELECT
    CRT
    CRT "---------------------------------------------------------------"
    CRT

    CMD = "SELECT F.SIBS.MESSAGE.TAG.SB"
    EXEC CMD
    LOOP
        READNEXT YID ELSE YID = ""
    WHILE YID DO
        READ R.TEMP FROM F.SIBS, YID THEN
            Y1 = R.TEMP<1>
            LOCATE Y1 IN YMAP<1,1> SETTING POS THEN
                IB.ID = YMAP<2,POS>
                READ R.IB FROM F.IB, IB.ID THEN
                    Y.UPD = 0
                    FOR NN = 7 TO 11
                        IF R.TEMP<NN> THEN
                            R.IB<NN> = CHANGE(R.TEMP<NN>,"SIBS.","IB.")
                            Y.UPD = 1
                        END
                    NEXT NN
                    R.IB<26> = "IHLD"
                    WRITE R.IB TO F.IB.NAU, IB.ID
                END
            END
        END
    REPEAT

    STOP

END
