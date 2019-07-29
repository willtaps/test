    PROGRAM UPDATE.LINK.X

    OPEN "","F.IB.ATM.POS.LINK.SB" TO F.IB ELSE NULL
    OPEN "","F.SIBS.ATM.POS.LINK.SB" TO F.SIBS ELSE NULL
    OPEN "","F.IB.ATM.POS.LINK.SB$NAU" TO F.IB.NAU ELSE NULL

    CMD = "SELECT F.SIBS.ATM.POS.LINK.SB"
    CRT CMD
    EXEC CMD
    LOOP
        READNEXT YID ELSE YID = ""
    WHILE YID DO
        READ R.TEMP FROM F.SIBS, YID THEN
            IB.ID = YID
            FOR NN = 1 TO 12
                IF R.TEMP<NN> THEN
                    R.IB<NN> = CHANGE(R.TEMP<NN>,"SIBS.","IB.")
                    Y.UPD = 1
                END
            NEXT NN
            R.IB<26> = "IHLD"
            WRITE R.IB TO F.IB.NAU, IB.ID
        END
    REPEAT

    STOP

END
