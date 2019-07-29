*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
    PROGRAM TEST.EDST.X

    YID = "EDST100496BE"
    CALL IB.EDST.CLEARING.SB.LOAD

    CALL IB.EDST.CLEARING.SB(YID)
    CALL JOURNAL.UPDATE("")
    STOP

END
